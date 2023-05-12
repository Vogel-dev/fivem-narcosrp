--       Licensed under: AGPLv3        --
--  GNU AFFERO GENERAL PUBLIC LICENSE  --
--     Version 3, 19 November 2007     --

ip = GetConvar('es_couchdb_url', '94.23.90.14') 	        -- Change to wherever your DB is hosted, use convar
port = GetConvar('es_couchdb_port', '3306') 	        -- Change to whatever port you have CouchDB running on, use convar
auth = GetConvar('es_couchdb_password', 'db_52198:zY8n9CyArWfc') 	-- "user:password", if you have auth setup, use convar
metrics = GetConvar('es_enable_metrics', '1')           -- Change to '0' to disable metrics, no identifiable data is stored