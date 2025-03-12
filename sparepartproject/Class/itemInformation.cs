using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


public class itemInformation
{
    public class getInformationItem
    {
        public string _model { get; set; }
        public string _purposeBy { get; set; }
        public string _proposedBy { get; set; }
        public string _line { get; set; }
        public int _cell { get; set; }
        public string _pic { get; set; }
        public string _informationItem { get; set; }
        public string _cause { get; set; }

        public string _dateTime { get; set; }
        public byte[] _attachment { get; set; }


        //public string _price { get; set; }
    }

    public static DataTable getInformationItemCustomDate(string dateFrom, string dateTo, string model)
    {
        SqlDataAdapter da = new SqlDataAdapter("[MTC_getInformationItem_CustomDate]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@dateto", dateTo);
        da.SelectCommand.Parameters.AddWithValue("@model", model);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getInformationItem_ExportSummary(string dateFrom)
    {
        SqlDataAdapter da = new SqlDataAdapter("[MTC_getInformationItemSummary]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }

    public static DataTable getInformationItem_ExportSummaryModel(string dateFrom, string model)
    {
        SqlDataAdapter da = new SqlDataAdapter("[MTC_getInformationItemSummary_Model]", ConfigurationManager.ConnectionStrings["dashboardConnectionString"].ConnectionString);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        da.SelectCommand.Parameters.AddWithValue("@datefrom", dateFrom);
        da.SelectCommand.Parameters.AddWithValue("@model", model);
        DataTable dt = new DataTable();
        da.Fill(dt);

        return dt;
    }
}
