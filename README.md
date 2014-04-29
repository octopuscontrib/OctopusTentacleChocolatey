OctopusTentacle
=======================
OctopusTentacle is a chocolatey package, for installing the Octopus Deploy Tentacle agent. 

## How to get started:
**Step 1:** Install chocolatey - see chocolatey.org

Download the OctopusContrib.NewRelic NuGet package from NuGet.Org or download directly from github. 

**Step 2:** Install the Octopus Tentacle

To install the tentacle, issue 'cinst OctopusTentacle' at a prompt. The package supports a series of arguments

  


- *Port*: which port the tentacle is listening to. Default is 10933
- *Thumbprint*: Octopus Deploy Server thumbprint to thrust.
- *OctopusUrl*: Url to the Octopus Deploy Server. Just specify the dns - e.g. octopus.yourcompany.com. There's a seperate argument for specifying https. This argument can be omitted, if you want to manually register the tentacle with the server. 
- *Environment*: Environment to register the tentacle with the server. This argument can be omitted, if you want to manually register the tentacle with the server. 
- *ApiKey*: An API key, which is authorized to register new tentacles. This argument can be omitted, if you want to manually register the tentacle with the server. 
- *Role*: Role of the machine where the tentacle is being installed. This argument can be omitted, if you want to manually register the tentacle with the server. 
- *InstanceName*: Name of the tentacle on both on the tentacle host and the server. 
- *UseSSL*: Set to true, if your Octopus Deploy Server use https

**Examples**

Install the tentacle to a machine on port 12345 and thrust the server thumbprint 
```
cinst octopus.tentacle -InstallArguments "/Port:12345 /Thumbprint:6EC9D253F98D942AD5ACC5BE7799B754C8C8325F
```

Install the tentacle and register the tentacle on the server in the 'Dev' environment, with the role 'SomeNewRole' and the instance name 'web-server'
```
cinst octopus.tentacle -InstallArguments "/Port:12345 /Thumbprint:6EC9OSIDFJWOIJWEFLK929292U92JJF9J292829F /OctopusUrl:octopus.somecompany.com /Environment:Dev /ApiKey:'API-K23L320W09FW09W9WE09EW0WWS' /InstanceName:web-server /Role:SomeNewRole
```

