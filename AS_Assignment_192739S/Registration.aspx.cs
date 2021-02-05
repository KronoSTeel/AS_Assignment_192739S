using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net;
using System.IO;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace AS_Assignment_192739S
{
    public partial class Registration : System.Web.UI.Page
    {
        string MYDBConnectionString =System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnection"].ConnectionString;
        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            var checker = 0;
            var FName = HttpUtility.HtmlEncode(tb_FName.Text);
            var LName = HttpUtility.HtmlEncode(tb_LName.Text);
            var CCNo = HttpUtility.HtmlEncode(tb_CCNo.Text);
            var ExpDate = HttpUtility.HtmlEncode(tb_ExpDate.Text);
            var CVV = HttpUtility.HtmlEncode(tb_CVV.Text);
            var Email = HttpUtility.HtmlEncode(tb_Email.Text);
            var Passwd = HttpUtility.HtmlEncode(tb_Passwd.Text);
            var CnfmPasswd = HttpUtility.HtmlEncode(tb_CnfmPasswd.Text);
            var DOB = HttpUtility.HtmlEncode(tb_DOB.Text);
            if (IsValidEmail(Email) == false)
            {
                lb_EmailChecker.Text = "Invalid Email";
                lb_EmailChecker.ForeColor = Color.Red;
            }
            else if (IsValidEmail(Email) == true)
            {
                checker++;
            }
            int scores = checkPassword(Passwd);
            string status = "";
            switch (scores)
            {
                case 1:
                    status = "Weak Passwords are not allowed";
                    break;

                case 2:
                    status = "Weak Passwords are not allowed";
                    break;

                case 3:
                    status = "Weak Passwords are not allowed";
                    break;

                case 4:
                    status = "Weak Passwords are not allowed";
                    break;

                case 5:
                    //all good
                    break;
            }
            lb_PasswdChecker.Text = status;
            if (scores < 4)
            {
                lb_PasswdChecker.ForeColor = Color.Red;
            }
            else
            {
                checker++;
            }
            if (CnfmPasswd != Passwd)
            {
                lb_CnfmChecker.Text = "Passwords do not match!";
                lb_CnfmChecker.ForeColor = Color.Red;
            }
            else if(CnfmPasswd == Passwd)
            {
                checker++;
            }
            if(IsCreditCardInfoValid(CCNo, ExpDate, CVV) == false)
            {
                lb_CCMsg.Text = "Credit Card information is not valid!";
                lb_CCMsg.ForeColor = Color.Red;
            }
            else if(IsCreditCardInfoValid(CCNo, ExpDate, CVV) == true)
            {
                lb_CCMsg.Text = "";
                checker++;
            };
            if (checker == 4)
            {
                string pwd = Passwd.Trim(); ;
                //Generate random "salt"
                RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
                byte[] saltByte = new byte[8];
                //Fills array of bytes with a cryptographically strong sequence of random values.
                rng.GetBytes(saltByte);
                salt = Convert.ToBase64String(saltByte);
                SHA512Managed hashing = new SHA512Managed();
                string pwdWithSalt = pwd + salt;
                byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
                byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                finalHash = Convert.ToBase64String(hashWithSalt);
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.GenerateKey();
                Key = cipher.Key;
                IV = cipher.IV;
                createAccount(Email, FName, LName, CCNo, ExpDate, CVV, DOB);
                Response.Redirect("Login.aspx", true);
            }

        }

        private int checkPassword(string password)
        {
            int score = 0;
            if (password.Length < 8)
            {
                return 1;
            }
            else
            {
                score = 1;
            }
            if (Regex.IsMatch(password, "[a-z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[A-Z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[0-9]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[$@$!%*&]"))
            {
                score++;
            }
            return score;
        }

        public static bool IsCreditCardInfoValid(string cardNo, string expiryDate, string cvv)
        {
            var cardCheck = new Regex(@"^(4096|4119|4182|4265|4508|4524|4547|4556|4628|4966|5240|5243|5264|5289|5400|5421|5498|5520|5521|5548|5588)([\-\s]?[0-9]{4}){3}$");
            var monthCheck = new Regex(@"^(0[1-9]|1[0-2])$");
            var yearCheck = new Regex(@"^20[0-9]{2}$");
            var cvvCheck = new Regex(@"^\d{3}$");

            if (!cardCheck.IsMatch(cardNo)) 
                return false;
            if (!cvvCheck.IsMatch(cvv)) 
                return false;

            var dateParts = expiryDate.Split('/');            
            if (!monthCheck.IsMatch(dateParts[0]) || !yearCheck.IsMatch(dateParts[1])) // <3 - 6>
                return false; 

            var year = int.Parse(dateParts[1]);
            var month = int.Parse(dateParts[0]);
            var lastDateOfExpiryMonth = DateTime.DaysInMonth(year, month); 
            var cardExpiry = new DateTime(year, month, lastDateOfExpiryMonth, 23, 59, 59);

            return (cardExpiry > DateTime.Now && cardExpiry < DateTime.Now.AddYears(6));
        }

        public static bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;

            try
            {
                email = Regex.Replace(email, @"(@)(.+)$", DomainMapper,
                                      RegexOptions.None, TimeSpan.FromMilliseconds(200));
                string DomainMapper(Match match)
                {
                    var idn = new IdnMapping();
                    string domainName = idn.GetAscii(match.Groups[2].Value);

                    return match.Groups[1].Value + domainName;
                }
            }
            catch (RegexMatchTimeoutException e)
            {
                return false;
            }
            catch (ArgumentException e)
            {
                return false;
            }

            try
            {
                return Regex.IsMatch(email,
                    @"^[^@\s]+@[^@\s]+\.[^@\s]+$",
                    RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250));
            }
            catch (RegexMatchTimeoutException)
            {
                return false;
            }
        }

        public void createAccount(string email, string fname, string lname, string ccno, string expdate, string cvv, string dob)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(MYDBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Account VALUES(@Email, @FirstName, @LastName, @CCNo, @ExpDate, @CVV, @DOB, @PasswdHash, @PasswdSalt, @EmailVerified, @IV, @Key)"))
                {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@Email", email.Trim());
                            cmd.Parameters.AddWithValue("@FirstName", fname.Trim());
                            cmd.Parameters.AddWithValue("@LastName", lname.Trim());
                            cmd.Parameters.AddWithValue("@CCNo", Convert.ToBase64String(encryptData(ccno.Trim())));
                            cmd.Parameters.AddWithValue("@ExpDate", expdate.Trim());
                            cmd.Parameters.AddWithValue("@CVV", Convert.ToBase64String(encryptData(cvv.Trim())));
                            cmd.Parameters.AddWithValue("@DOB", dob.Trim());
                            cmd.Parameters.AddWithValue("@PasswdHash", finalHash);
                            cmd.Parameters.AddWithValue("@PasswdSalt", salt);
                            cmd.Parameters.AddWithValue("@EmailVerified", DBNull.Value);
                            cmd.Parameters.AddWithValue("@IV", Convert.ToBase64String(IV));
                            cmd.Parameters.AddWithValue("@Key", Convert.ToBase64String(Key));
                            cmd.Connection = con;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        protected byte[] encryptData(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                //ICryptoTransform decryptTransform = cipher.CreateDecryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return cipherText;
        }

        protected void btn_GotoLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx", true);
        }
    }
}