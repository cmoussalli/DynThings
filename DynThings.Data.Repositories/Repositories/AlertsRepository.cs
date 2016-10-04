using DynThings.Core;
using DynThings.Data.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DynThings.Data.Repositories
{
    public class AlertsRepository
    {
        #region Constructor
        public DynThingsEntities db { get; set; }
        public AlertsRepository(DynThingsEntities dynThingsEntities)
        {
            this.db = dynThingsEntities;
        }
        #endregion

        #region GetList
        public List<Alert> GetList()
        {
            List<Alert> ends = db.Alerts.ToList();
            return ends;
        }
        #endregion

        #region Get PagedList
        public IPagedList GetPagedList(string search, int pageNumber, int recordsPerPage)
        {
            IPagedList alrs = db.Alerts
              .Where(e => search == null || e.Title.Contains(search))
              .OrderBy(e => e.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return alrs;
        }
        #endregion

        #region Find

        public Alert Find(long id)
        {
            Alert alrt = new Alert();
            List<Alert> alrts = db.Alerts.Where(l => l.ID == id).ToList();
            if (alrts.Count == 1)
            {
                alrt = alrts[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return alrt;
        }

        #endregion

        #region Add
        public ResultInfo.Result Add(string title)
        {
            Alert alrt = new Alert();
            try
            {
                alrt.Title = title;
                alrt.Message = "Alert from [Thing], reported [EndpointType]: [Value] [Measurement] @[TimeStamp]";
                alrt.IsActive = false;
                alrt.Sunday = false;
                alrt.Monday = false;
                alrt.Tuesday = false;
                alrt.Wednesday = false;
                alrt.Thursday = false;
                alrt.Friday = false;
                alrt.Saturday = false;
                alrt.StartTime = new TimeSpan(0, 0, 0);
                alrt.EndTime = new TimeSpan(23, 59, 59);

                db.Alerts.Add(alrt);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", alrt.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Edit: Main
        public ResultInfo.Result EditMain(long id, string title,string message, bool isActive)
        {
            try
            {
                Alert alrt = db.Alerts.Find(id);
                alrt.Title = title;
                alrt.IsActive = isActive;
                alrt.Message = message;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", alrt.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }

        }

        #endregion

        #region Edit: Message
        public ResultInfo.Result EditMessage(long id, string message)
        {
            try
            {
                Alert alrt = db.Alerts.Find(id);
                alrt.Message = message;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", alrt.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }

        }

        #endregion

        #region Edit: Schedule
        public ResultInfo.Result EditSchedule(long id, bool Sunday, bool Monday,bool Tuesday,bool Wednesday,bool Thursday,bool Friday,bool Saturday, TimeSpan StartTime , TimeSpan EndTime)
        {
            try
            {
                Alert alrt = db.Alerts.Find(id);
                alrt.Sunday = Sunday;
                alrt.Monday = Monday;
                alrt.Tuesday = Tuesday;
                alrt.Wednesday = Wednesday;
                alrt.Thursday = Thursday;
                alrt.Friday = Friday;
                alrt.Saturday = Saturday;
                alrt.StartTime = StartTime;
                alrt.EndTime = EndTime;
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", alrt.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }

        }

        #endregion

        #region Delete
        public ResultInfo.Result Delete(long id)
        {
            try
            {
                Alert alrt = db.Alerts.Find(id);
                db.Alerts.Remove(alrt);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", alrt.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion


        #region Conditions
        #region Conditions: Get PagedList
        public IPagedList GetConditionsPagedList(long AlertID, string search, int pageNumber, int recordsPerPage)
        {
            IPagedList cons = db.AlertConditions

              .Where(e => e.AlertID == AlertID
              && (search == null || e.ConditionValue.Contains(search)))
              .OrderBy(e => e.Thing.Title).ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cons;
        }
        #endregion

        #region Conditions: Find
        public AlertCondition FindCondition(long id)
        {
            AlertCondition con = new AlertCondition();
            List<AlertCondition> cons = db.AlertConditions.Where(l => l.ID == id).ToList();
            if (cons.Count == 1)
            {
                con = cons[0];
            }
            else
            {
                throw new Exception("Not Found");
            }
            return con;
        }

        #endregion

        #region Conditions: Add
        public ResultInfo.Result AddCondition(long AlertID, long ThingID, long IOTypeID, long EndPointTypeID, long ConditionTypeID, string ConditionValue, bool IsMust)
        {
            AlertCondition con = new AlertCondition();
            try
            {
                con.AlertID = AlertID;
                con.ThingID = ThingID;
                con.IOTypeID = IOTypeID;
                con.EndPointTypeID = EndPointTypeID;
                con.ConditionTypeID = ConditionTypeID;
                con.ConditionValue = ConditionValue;
                con.IsMust = IsMust;

                db.AlertConditions.Add(con);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", con.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Conditions: Edit
        public ResultInfo.Result EditCondition(long ID, long ThingID, long IOTypeID, long EndPointTypeID, long ConditionTypeID, string ConditionValue, bool IsMust)
        {
            try
            {
                AlertCondition con = db.AlertConditions.Find(ID);
                con.ThingID = ThingID;
                con.IOTypeID = IOTypeID;
                con.EndPointTypeID = EndPointTypeID;
                con.ConditionTypeID = ConditionTypeID;
                con.ConditionValue = ConditionValue;
                con.IsMust = IsMust;

                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", con.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion

        #region Conditions: Delete
        public ResultInfo.Result DeleteCondition(long id)
        {
            try
            {
                AlertCondition con = db.AlertConditions.Find(id);
                db.AlertConditions.Remove(con);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted", con.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }

        #endregion



        #endregion


        #region Users
        #region Users: Get PagedList
        public IPagedList GetUsersPagedList(long AlertID, string search, int pageNumber, int recordsPerPage)
        {
            IPagedList cons = db.LinkUsersAlerts

              .Where(e => e.AlertID == AlertID
              && (search == null || e.AspNetUser.UserName.Contains(search)))
              .Include("AspNetUser")
              .ToList()
              .ToPagedList(pageNumber, recordsPerPage);
            return cons;
        }
        #endregion

        #region Users: Attach
        public ResultInfo.Result AttachUser(long AlertID, string UserID)
        {
            LinkUsersAlert lnk = new LinkUsersAlert();
            try
            {
                lnk.AlertID = AlertID;
                lnk.UserID = UserID;

                db.LinkUsersAlerts.Add(lnk);
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Saved", lnk.ID);
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }
        #endregion


        #region Users: DeattachUser
        public ResultInfo.Result DeattachUser(long AlertID, string UserID)
        {
            try
            {
                List<LinkUsersAlert> lnks = db.LinkUsersAlerts.Where(l => l.UserID == UserID && l.AlertID == AlertID).ToList();
                foreach (LinkUsersAlert lnk in lnks)
                {
                    db.LinkUsersAlerts.Remove(lnk);
                }
                db.SaveChanges();
                return ResultInfo.GenerateOKResult("Deleted");
            }
            catch
            {
                return ResultInfo.GetResultByID(1);
            }
        }
        #endregion



        #endregion


    }
}
