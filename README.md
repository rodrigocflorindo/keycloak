For installation of Keycloak:

a. Download main package
b. Unzip package
c. Create Keycloak service
d. Start and Enable Keycloak service

wget https://github.com/keycloak/keycloak/releases/download/15.0.2/keycloak15.0.2.zip --no-check-certificate

unzip keycloak-15.0.2.zip -d /opt/

vim /etc/systemd/system/keycloak.service

[Unit]
Description=Keycloak
After=network.target
[Service]
Type=idle
User=root
Group=root
ExecStart=/opt/keycloak-15.0.2/bin/standalone.sh -b 0.0.0.0 -
Djboss.socket.binding.port-offset=100 -Djboss.https.port=9443
TimeoutStartSec=600
TimeoutStopSec=600
[Install]
WantedBy=multi-user.target

systemctl daemon-reload && systemctl enable keycloak && systemctl start keycloak

e. Create Administrator user (changing default password)

/opt/keycloak-15.0.2/bin/add-user-keycloak.sh -r master -u admin -p changeit

f. Access Keycloak Web Interface

Check: https://[MAIN_SERVER]:8543/, option Administration Console

g. Create DMPS Domain

Check: https://www.keycloak.org/docs/latest/getting_started/index.html#creating-a-realm, using the
sample file provided by FICO Professional Services Team.
h. Create DMPS Client
Check:
https://www.keycloak.org/docs/latest/authorization_services/#_getting_started_hello_world_enabling_authz
_services, using the sample file provided by FICO Professional Services Team.
i. Create users
Check https://www.keycloak.org/docs/latest/getting_started/index.html#creating-a-user,
j. Extract X509 Certificate (for DMPS Gateway)
Using ‘admin’ user, access option (DMPS Realm): Realm Settings -> Keys-> RS256/RSA ->
Certificate (button):
/opt/keycloak-15.0.2/bin/add-user-keycloak.sh -r master -u admin -p changeit
