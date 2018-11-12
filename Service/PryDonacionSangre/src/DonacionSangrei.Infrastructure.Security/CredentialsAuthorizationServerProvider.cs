using DonacionSangre.BusinessServices;
using Microsoft.Owin.Security.OAuth;
using System.Security.Claims;
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
            if (loginValido == null)
            {
                context.SetError("invalid_credentials", "The user name or password is incorrect.");
                return Task.FromResult<object>(null);
            }

            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
            identity.AddClaim(new Claim(ClaimTypes.Role, "user"));
            identity.AddClaim(new Claim("Id", loginValido.IdUsuario.ToString()));
            context.Validated(identity);

            return base.GrantResourceOwnerCredentials(context);
        }
    }
}
