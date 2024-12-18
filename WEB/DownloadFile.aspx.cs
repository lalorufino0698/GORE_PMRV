using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DownloadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string filePath = Request.QueryString["file"];
            string fileName = System.IO.Path.GetFileName(filePath);
            Uri uri = new Uri(filePath);
            string ipAddress = uri.Host;

            FtpWebRequest request = (FtpWebRequest)WebRequest.Create("ftp://" + ipAddress + "/" + fileName);

            request.Method = WebRequestMethods.Ftp.DownloadFile;

            request.Credentials = new NetworkCredential("administrador", "cafed2024.");

            FtpWebResponse response = (FtpWebResponse)request.GetResponse();

            using (MemoryStream stream = new MemoryStream())
            {
                response.GetResponseStream().CopyTo(stream);
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.BinaryWrite(stream.ToArray());
                Response.End();
            }
        }
        

    }
}