using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sparepartproject
{
    public partial class KeepAlive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string logFilePath = Server.MapPath("~/App_Data/session_log.txt");
                string sessionInfo = $"Session ID: {Session.SessionID}, Last Accessed: {Session["LastActivity"]}, DateTime: {DateTime.Now}";
                System.IO.File.AppendAllText(logFilePath, sessionInfo + Environment.NewLine);
            }
            catch (Exception ex)
            {
                // Log error jika terjadi masalah dalam penulisan file
                string errorLogPath = Server.MapPath("~/App_Data/error_log.txt");
                System.IO.File.AppendAllText(errorLogPath, $"Error: {ex.Message}, DateTime: {DateTime.Now}" + Environment.NewLine);
            }
        }
    }
}