using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SRVTextToImage;
using System.Drawing;
using System.Drawing.Imaging;

public partial class Captcha : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CaptchaRandomImage CI = new CaptchaRandomImage();
        string captchaText = CI.GetRandomString(5);
        CI.GenerateImage(captchaText, 200, 50);
        Session["captchaText"] = captchaText;
        CI.GenerateImage(captchaText, 200, 50, Color.DarkGray, Color.White);

        this.Response.Clear();
        this.Response.ContentType = "image/jpeg";
        CI.Image.Save(this.Response.OutputStream, ImageFormat.Jpeg);
        CI.Dispose();

    }
}