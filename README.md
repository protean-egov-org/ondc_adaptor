# ONDC API developed by NSDL eGov complied with Beckn Protocol
This page will contains the details of ONDC APIs Adaptors developed by NSDL eGov complied with Beckn Protocol

# Table of contents
1. [Introduction](#introduction)
2. [ONDC API Adaptor Flow](#paragraph1)
3. [Deployment](#paragraph1)
4. [Postgres DB script](#paragraph1)
5. [Sample Postman Collection](#paragraph1)
6. [Configuration Details](#paragraph1)
7. [NSDL BG Configuration Details](#paragraph1)
8. [NSDL Sandbox](#paragraph1)

# Version History

| Sr.No.  	|Description   	|Date   	|Version   	|
|---	|---	|---	|---	|
|  1. 	|Initial Version of Adaptor   	|   	|1.0   	|
|  2. 	|Change in adaptor with JPA and no JPA   	|   	|1.1   	|
|  3. 	|Change in adaptor to handle multi-tenancy   	|  25-Jan-2022 	|1.2   	|

# 1. Introduction
ONDC aims at promoting open networks developed on open-sourced methodology, using open specifications and open network protocols independent of any specific platform. NSDL eGov is helping building the ONDC API adaptors which is powered by Beckn Protocols for the network participants who can easily run and integrate with their applications.
# 2. ONDC API Adaptor Flow
![alt text](https://github.com/dhiraj-nsdl/Beckn-API/blob/main/image/Adaptor%20Architecture%20flow%20updated.png)
# 3. Deployment
Two options are available: 
1. Default - Run it as a microservice. (It can be also docker enabled). <b>Use OpenJDK11 and above</b>
2.  Integration with Java application. <br />
  a. Put the jar file in maven dependency directory<br />
  b. Add package scan in pom.xml<br />
# 4. Postgres DB script
Postgres DB scripts have been provided who wish to capture API transaction details in their database for audit.
# 5. Sample Postman Collection
Postman collection have been provided with sample json for each API services.
# 6. Configuration Details
  a. BAP - buyer node Configuration ("buyer node" compliant with Beckn BAP specifications)
      <br /> <b>1. If you are using beckn-multi-api-jpa-0.0.1.jar file then postgres properties can be passed. 
      <br />2. If you are using beckn-multi-api-0.0.1.jar then you dont need to pass "db-postgres" property. 
      <br /> 3. If you want to logs transaction in log file then "file" property needs to passed in configuration. </b>
1. Application.yml 
```bash
      a) server:
          port: 8080
      b) ehcache:
            cacheregion:
              beckn-api:
                common-cache:
                  timetolive: 86400
                  entrycount: 1000
                lookup-cache:
                  timetolive: 1800
                  entrycount: 1000
      c) beckn:
          persistence:
            type: http|db-postgres|file
            audit-schema-error: true
            file-path: ./
          entity:
            type: buyer
            
            
```
Description :
1. port: it is server port number on which this jar will run
2. ehcache: The ehcache have been added which will cache the lookup api data fetched from the registry for the defined hours.
3. beckn.persistence.type: the pipe separated value for persistence strategy. Currently allowed values are http & db-postgres. Value http means response will be pushed to the        url mentioned in the  http_entity_endpoint parameter. If db-postgres used then response will be saved in database. Any other value is not allowed.
4. beckn.entity.type: the allowed values are bap or bpp. Depending on the value provided, jar will all auto configuration internally and start working accordingly . Any other        value is not allowed.
    
    2. adaptor-config-bap.json <br/>
    <b> a) Now multiple buyers or sellers can be configured in the json config file of the adaptor. As a result of this change, the config json file is an array of configurations for each buyer/seller.</b> <br/>
     <b> b) The password of the certificate(.p12) is now base-64 encoded in the config file. So please do not use plain text. First encode the given password and then use it. The adaptor will automatically decode it.</b> <br/>
     <b> c) If Key Pair based configuration to be used then set "certificate_used" value as false and configure private key value in "private_key" parameter.</b> <br/>
    <b>  d) There is a change in adaptor-config-buyer.json & adaptor-config-seller.json for multi-tenancy. subscriber_id has been introduced in the root section: This is required for subscriber matching.</b><br/>


{<br/>

"subscriber_id": "https://mock_bap1.com/",<br/>

...<br/>

},<br/>
```bash
  [
	{
		"subscriber_id": "https://mock_bap1.com/",
		"keyid": "buyer1.in|6",
		"signing": {
			"certificate_used": false,
			"certificate_type": "",
			"certificate_alias": "",
			"certificate_path": "",
			"certificate_pwd": "",
			"private_key": "K2qouM7hs57AStiEcKfCvXTgLtVFxMRhhCsbBUrWVaI="
		},
		"api": [
			{
				"name": "search",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "select",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": false,
				"set_authorization_header": false
			},
			{
				"name": "cancel",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "confirm",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "init",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "rating",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "status",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "support",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "track",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "update",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "lookup",
				"http_entity_endpoint": "https://pilot-gateway-1.beckn.nsdl.co.in/lookup",
				"http_timeout": 9000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": false
			}
		]
	},
	{
		"subscriber_id": "https://mock_bap2.com/",
		"keyid": "buyer2.in|6",
		"signing": {
			"certificate_used": false,
			"certificate_type": "",
			"certificate_alias": "",
			"certificate_path": "",
			"certificate_pwd": "",
			"private_key": "cDs6yVU5VpAVCe9MCtHUf/muUKok287sgJkJvsuL/5Q="
		},
		"api": [
			{
				"name": "search",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "select",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": false,
				"set_authorization_header": false
			},
			{
				"name": "cancel",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "confirm",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "init",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "rating",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "status",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "support",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "track",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "update",
				"http_entity_endpoint": "",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "lookup",
				"http_entity_endpoint": "https://pilot-gateway-1.beckn.nsdl.co.in/lookup",
				"http_timeout": 9000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": false
			}
		]
	}
]
```
Description: (As given in above example, add call back url configuration in array)
1. keyid: it is the id that is used while registering as buyer to beckn.
2. private_key: it is the private key of the buyer. This will be used while signing the authorization header.
3. name: name of the api like search/select/init.
4. http_entity_endpoint: http url for the entity endpoint of buyer.
5. http_timeout: http call timeout in milliseconds .
6. http_retry_count: http retry count in case of timeout error.
7. header_validity: auth header validity in milliseconds.
8. header_authentication: auth header validation check. Allowed values true or false. If false auth header validation will be skipped.

b. BPP - seller node Configuration ("seller node" compliant with Beckn BPP specifications)
       <br /> <b>1. If you are using beckn-multi-api-jpa-0.0.1.jar file then postgres properties can be passed. 
      <br />2. If you are using beckn-multi-api-0.0.1.jar then you dont need to pass "db-postgres" property. 
      <br /> 3. If you want to logs transaction in log file then "file" property needs to passed in configuration. </b>
1. Application.yml 
```bash
      a) server:
          port: 8080
      b) ehcache:
            cacheregion:
              beckn-api:
                common-cache:
                  timetolive: 86400
                  entrycount: 1000
                lookup-cache:
                  timetolive: 1800
                  entrycount: 1000
      c) beckn:
          persistence:
                 type: http|db-postgres|file
                 audit-schema-error: true
          entity:
                 type: seller
```  
Description :
1. port: it is server port number on which this jar will run
2. ehcache: The ehcache have been added which will cache the lookup api data fetched from the registry for the defined hours.
3. beckn.persistence.type: the pipe separated value for persistence strategy. Currently allowed values are http & db-postgres. Value http means response will be pushed to the        url mentioned in the  http_entity_endpoint parameter. If db-postgres used then response will be saved in database. Any other value is not allowed.
4. beckn.entity.type: the allowed values are bap or bpp. Depending on the value provided, jar will all auto configuration internally and start working accordingly . Any other        value is not allowed.
    
    2. adaptor-config-bpp.json<br/>
    <b> a) Now multiple buyers or sellers can be configured in the json config file of the adaptor. As a result of this change, the config json file is an array of configurations for each buyer/seller.</b> <br/>
     <b> b) The password of the certificate(.p12) is now base-64 encoded in the config file. So please do not use plain text. First encode the given password and then use it. The adaptor will automatically decode it.</b> <br/>
     <b> c) If Key Pair based configuration to be used then set "certificate_used" value as false and configure private key value in "private_key" parameter.</b> <br/>
    <b>  d) There is a change in adaptor-config-buyer.json & adaptor-config-seller.json for multi-tenancy. subscriber_id has been introduced in the root section: This is required for subscriber matching.</b><br/>

{<br/>

"subscriber_id": "https://mock_bap1.com/",<br/>

...<br/>

},<br/>
```bash
Sample Json
       [
	{
		"subscriber_id": "https://mock_bpp1.com/",
		"keyid": "seller1.in|8",
		"signing": {
			"certificate_used": false,
			"certificate_type": "",
			"certificate_alias": "",
			"certificate_path": "",
			"certificate_pwd": "",
			"private_key": "cDs6yVU5VpAVCe9MCtHUf/muUKok287sgJkJvsuL/5Q="
		},
		"api": [
			{
				"name": "search",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/search",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "select",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/select",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "cancel",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/cancel",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "confirm",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/confirm",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "init",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/init",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "rating",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/rating",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "status",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/status",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "support",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/support",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "track",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/track",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "update",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/update",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "lookup",
				"http_entity_endpoint": "https://pilot-gateway-1.beckn.nsdl.co.in/lookup",
				"http_timeout": 9000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": false
			}
		]
	},
	{
		"subscriber_id": "https://mock_bpp2.com/",
		"keyid": "seller2.in|8",
		"signing": {
			"certificate_used": false,
			"certificate_type": "",
			"certificate_alias": "",
			"certificate_path": "",
			"certificate_pwd": "",
			"private_key": "K2qouM7hs57AStiEcKfCvXTgLtVFxMRhhCsbBUrWVaI="
		},
		"api": [
			{
				"name": "search",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/search",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "select",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/select",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "cancel",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/cancel",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "confirm",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/confirm",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "init",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/init",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "rating",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/rating",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "status",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/status",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "support",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/support",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "track",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/track",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "update",
				"http_entity_endpoint": "http://localhost:8089/seller/mock/update",
				"http_timeout": 8000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": true
			},
			{
				"name": "lookup",
				"http_entity_endpoint": "https://pilot-gateway-1.beckn.nsdl.co.in/lookup",
				"http_timeout": 9000,
				"http_retry_count": 0,
				"header_validity": 600000,
				"header_authentication": true,
				"set_authorization_header": false
			}
		]
	}
]
```  
Description: (As given in above example, add call back url configuration in array)
1. keyid: it is the id that is used while registering as seller to beckn.
2. private_key: it is the private key of the seller. This will be used while signing the authorization header.
3. name: name of the api like search/select/init. 
4. http_entity_endpoint: http url for the entity endpoint of seller. 
5. http_timeout: http call timeout in milliseconds .
6. http_retry_count: http retry count in case of timeout error.
7. header_validity: auth header validity in milliseconds.
8. header_authentication: auth header validation check. Allowed values true or false. If false auth header validation will be skipped.
  
# 7. BG - gateway node/Registry node Configuration Details
To get register at BG - gateway node/Registry node below field details required:
1. subscriber_id
2. Domain
3. Entity Type (BAP/BPP)
4. CallBack URL for On_Subscribe
5. Signing Public Key

The end points for BG Gateway Node are as below: ("gateway node" compliant with Beckn gateway specifications) <br />
a. Search : https://pilot-gateway-1.beckn.nsdl.co.in/search <br />
b. On_search : https://pilot-gateway-1.beckn.nsdl.co.in/on_search

The end points for Registry Node are as below: ("registry node" compliant with Beckn registry specifications) <br />
a. https://pilot-gateway-1.beckn.nsdl.co.in/subscribe <br />
b. https://pilot-gateway-1.beckn.nsdl.co.in/lookup

Mail your details at : dhirajp@nsdl.co.in

# 8. NSDL Sandbox
1. BG - Gateway Node:
As mentioned in section 7, provide details to get register with BG gateway node.

The end points for BG Gateway Node are as below: <br />
a. Search : https://pilot-gateway-1.beckn.nsdl.co.in/search <br />
b. On_search : https://pilot-gateway-1.beckn.nsdl.co.in/on_search

2. Registry Node:
As mentioned in section 7, provide details to get register with BG registry node.

The end points for Registry Node are as below: <br />
a. https://pilot-gateway-1.beckn.nsdl.co.in/subscribe <br />
b. https://pilot-gateway-1.beckn.nsdl.co.in/lookup
