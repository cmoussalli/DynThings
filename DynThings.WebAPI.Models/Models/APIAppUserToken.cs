using System;

namespace DynThings.WebAPI.Models
{
    public class APIAppUserToken
    {
        #region :: Public Properties ::

        public string AspNetUserID { get; set; }
        public Guid AppGUID { get; set; }
        public Guid Token { get; set; }

        public DateTime ExpireDate { get; set; }

        public DateTime CreateDate { get; set; }


        #endregion

        #region :: Constructor ::
        public APIAppUserToken()
        {
            this.AspNetUserID = "";
            this.CreateDate = new DateTime(2000, 1, 1);
            this.ExpireDate = CreateDate;
            this.Token = Guid.NewGuid();
        }
        #endregion
    }

}