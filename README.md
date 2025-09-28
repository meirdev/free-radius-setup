# FreeRADIUS Example

Adding a user:

```sql
INSERT INTO radcheck (username,attribute,op,value) VALUES ('meir','Cleartext-Password',':=','passme');
INSERT INTO radreply (username,attribute,op,value) VALUES ('meir','Framed-IP-Address',':=','84.108.22.82');
```

---

Sending a `Access-Request`:

```bash
radtest meir passme localhost 0 testing123 -x
```

Output:

```
Sent Access-Request Id 15 from 0.0.0.0:38118 to 127.0.0.1:1812 length 80
        User-Name = "meir"
        User-Password = "passme"
        NAS-IP-Address = 10.201.0.3
        NAS-Port = 0
        Message-Authenticator = 0x00
        Framed-Protocol = PPP
        Cleartext-Password = "passme"
Received Access-Accept Id 15 from 127.0.0.1:1812 to 127.0.0.1:38118 length 56
        Message-Authenticator = 0x611eea1ea1f001a73d673c7e6ae51bb9
        Framed-Protocol = PPP
        Framed-Compression = Van-Jacobson-TCP-IP
        Framed-IP-Address = 84.108.22.82
```

---

Sending a `Accouting-Request` (Start):

```bash
radclient -x localhost acct testing123 <<EOF
User-Name = "meir"
Acct-Session-Id = "hello"
Acct-Status-Type = Start
NAS-IP-Address = 10.201.0.3
NAS-Port = 0
EOF
```

Sending a `Accouting-Request` (Interim-Update):

```bash
radclient -x localhost acct testing123 <<EOF
User-Name = "meir"
Acct-Session-Id = "hello"
Acct-Status-Type = Interim-Update
NAS-IP-Address = 10.201.0.3
NAS-Port = 0
EOF
```

Sending a `Accouting-Request` (Stop):

```bash
radclient -x localhost acct testing123 <<EOF
User-Name = "meir"
Acct-Session-Id = "hello"
Acct-Status-Type = Stop
NAS-IP-Address = 10.201.0.3
NAS-Port = 0
EOF
```
