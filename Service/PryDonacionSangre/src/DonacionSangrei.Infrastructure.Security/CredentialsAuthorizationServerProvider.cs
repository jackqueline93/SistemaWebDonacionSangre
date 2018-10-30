using DonacionSangre.BusinessServices;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace DonacionSangrei.Infrastructure.Security
{
    public class CredentialsAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        private readonly IUsuarioBL usuarioBL;
        public CredentialsAuthorizationServerProvider()
        {
            usuarioBL = new UsuarioBL();
        }
        public override async Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            context.Validated();
        }

        public override Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            context.OwinContext.Response.Headers.Add("Access-Control-Allow-Origin", new[] { "*" });

            var loginValido = usuarioBL.ValidarLogin(context.UserName, context.Password);
            if (!loginValido)
            {
                context.SetError("invalid_credentials", "The user name or password is incorrect.");
                return Task.FromResult<object>(null);
            }

            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
            identity.AddClaim(new Claim(ClaimTypes.Role, "user"));
            context.Validated(identity);

            return base.GrantResourceOwnerCredentials(context);
        }
    }
}
