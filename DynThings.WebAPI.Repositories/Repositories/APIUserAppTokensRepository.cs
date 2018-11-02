using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DynThings.Core;
using PagedList;
using System.Security.Cryptography;
using DynThings.Data.Models;
using DynThings.WebAPI.Models;
using DynThings.WebAPI.Models.ResponseModels;
using DynThings.WebAPI.Repositories;
using ResultInfo;

namespace DynThings.WebAPI.Repositories
{
    public class APIUserAppTokensRepository
    {
        #region Constructor
        public APIUserAppTokensRepository(DynThingsEntities dbSource)
        {
            db = dbSource;
        }

        #endregion

        #region props
        private DynThingsEntities db;
        private APIUtilizationsRepository repoAPIUtilizations
        {
            get
            {
                APIUtilizationsRepository result = new APIUtilizationsRepository(db);
                return result;
            }
        }
        #endregion

        #region Helpers
        #region Verify Hashed Password
        private bool VerifyHashedPassword(string hashedPassword, string password)
        {
            bool result = false;
            byte[] buffer4;
            if (hashedPassword == null)
            {
                return false;
            }
            if (password == null)
            {
                throw new ArgumentNullException("password");
            }
            byte[] src = Convert.FromBase64String(hashedPassword);
            if ((src.Length != 0x31) || (src[0] != 0))
            {
                return false;
            }
            byte[] dst = new byte[0x10];
            Buffer.BlockCopy(src, 1, dst, 0, 0x10);
            byte[] buffer3 = new byte[0x20];
            Buffer.BlockCopy(src, 0x11, buffer3, 0, 0x20);
            using (Rfc2898DeriveBytes bytes = new Rfc2898DeriveBytes(password, dst, 0x3e8))
            {

                buffer4 = bytes.GetBytes(0x20);
            }
            return buffer3.SequenceEqual(buffer4); /*ByteArraysEqual(buffer3, buffer4);*/
        }

        #endregion

        #endregion



        #region Methods
        #region Get New Token
        public APIAppUserToken GetNewToken(Guid appGuid, string userName, string password)
        {
            APIAppUserToken apiToken = new APIAppUserToken();
            AppUserToken token = new AppUserToken();
            List<AspNetUser> usrs = db.AspNetUsers.Where(u => u.UserName == userName).ToList();
            if (usrs.Count > 0)
            {//User is exist
                //Validateing Password
                if (VerifyHashedPassword(usrs[0].PasswordHash, password))
                {//Validate App ID & Key
                    App app = db.Apps.First(a => a.GUID == appGuid);
                    if (app == null)
                    {//App not Found
                        throw new Exception("App not Found");
                    }
                    else
                    {//Create New Token
                        token.AppID = app.ID;
                        token.AspNetUserID = usrs[0].Id;
                        token.CreateDate = DateTime.Now;
                        token.ExpireDate = DateTime.Now.AddDays(180);
                        token.Token = Guid.NewGuid();
                        db.AppUserTokens.Add(token);
                        db.SaveChanges();
                        apiToken = TypesMapper.APITokenAdapter.fromToken(token);

                    }
                }
                else
                {//Wrong Password
                    throw new Exception("Wrong password");
                }
            }
            else
            {//User Not Exist
                throw new Exception("User not found");
            }
            return apiToken;
        }
        #endregion

        #region Validate Token
        public ApiResponse ValidateToken(Guid token)
        {
            Result result = Result.GenerateFailedResult();

            try
            {
                AppUserToken appUserToken = db.AppUserTokens.First(t => t.Token == token);
                if (appUserToken != null)
                {//Token is Exist
                    if (appUserToken.ExpireDate < DateTime.Now)
                    {//Token is Expired
                        result = Result.GenerateFailedResult("Token is Expired");
                    }
                    else
                    {//Token is Valid

                        result = result = Result.GenerateOKResult("Token is active");
                    }
                }
                else
                {//Token is not Exist
                    result = Result.GenerateFailedResult("Token is not exist");
                }
            }
            catch (Exception ex)
            {
                result = Result.GenerateFailedResult("Token is not exist");
            }
            ApiResponse apiResponse =  TypesMapper.ApiResponseAdapter.fromResult(result);
            return apiResponse;
        }
        #endregion

        #region Get Token Info
        public APIAppUserToken GetTokenInfo(Guid token)
        {
            APIAppUserToken result = new APIAppUserToken();
            try
            {
                AppUserToken appUserToken = db.AppUserTokens.First(t => t.Token == token);
                if (appUserToken != null)
                {//Token is Exist
                    if (appUserToken.ExpireDate < DateTime.Now)
                    {//Token is Expired
                        throw new Exception("Token is Expired");
                    }
                    else
                    {//Token is Valid
                        result = TypesMapper.APITokenAdapter.fromToken(appUserToken);
                    }
                }
                else
                {//Token is not Exist
                    throw new Exception("Token is not exist");
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Token is not exist");
            }

            return result;
        }
        #endregion

        #region Validate Token Entity Permission
        public ApiResponse ValidateTokenEntityPermission(Guid token, long entityID,long methodID)
        {
            Result res = Result.GenerateFailedResult();
            ApiResponse result = new ApiResponse();
            try
            {
                AppUserToken appUserToken = db.AppUserTokens.First(t => t.Token == token);
                if (appUserToken == null)
                {//Token is not Exist
                    string message = "Token is not exist";
                    repoAPIUtilizations.AddUnAuthorized(token, methodID, message);
                    res = Result.GenerateFailedResult(message);
                }
                else
                {//Token is Exist
                    if (appUserToken.ExpireDate < DateTime.Now)
                    {//Token is Expired
                        string message = "Token is Expired";
                        repoAPIUtilizations.AddUnAuthorized(token, methodID, message);
                        res = Result.GenerateFailedResult(message);
                    }
                    else
                    {//Token is Valid
                        List<AppAPIEntity> tokEntities = db.AppAPIEntitys.Where(a => a.AppID == (long)appUserToken.AppID && a.SystemEntityID == entityID).ToList();
                        if (tokEntities.Count == 0)
                        {//Token don't have access to Entity
                            string message = "Token is not allowed to access the requested entity";
                            repoAPIUtilizations.AddUnAuthorized(token, methodID, message);
                            res = Result.GenerateNotAuthorizedResult();
                        }
                        else
                        {//Token is allowed to access the Entity
                            string message = "Token is active and have access to " + tokEntities[0].SystemEntity.Title + " entity";
                            repoAPIUtilizations.AddSuccess((long)appUserToken.AppID, token, methodID, message);
                            res = Result.GenerateOKResult(message);
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                string message = "Token is not exist";
                repoAPIUtilizations.AddUnAuthorized( token, methodID, message);
                res = Result.GenerateFailedResult(message);
            }
            ApiResponse apiResponse = TypesMapper.ApiResponseAdapter.fromResult(res);
            return apiResponse;
        }
        #endregion



        #endregion

    }
}
