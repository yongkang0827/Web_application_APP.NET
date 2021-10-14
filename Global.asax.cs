using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace test2
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            if (!Roles.RoleExists("Artist"))
                Roles.CreateRole("Artist");
            if (!Roles.RoleExists("Customer"))
                Roles.CreateRole("Customer");
/*            if (Membership.FindUsersByName("yk123").Count == 0)
            {
                Membership.CreateUser("yk123", "abc123");
            }
            if (Membership.FindUsersByName("tan").Count == 0)
            {
                Membership.CreateUser("tan", "abc321");
            }

            if (!Roles.IsUserInRole("yk123", "Artist"))
            {
                Roles.AddUserToRole("yk123", "Artist");
            }
            if (!Roles.IsUserInRole("tan", "Customer"))
            {
                Roles.AddUserToRole("tan", "Customer");
            }
*/

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}