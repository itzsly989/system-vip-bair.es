fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'Bair.es'
author 'System vip bair.es by itzsly'
version '1.2.2'

dependencies {
    'oxmysql',
    'ox_lib'
}

shared_scripts {
    '@es_extended/locale.lua',
    '@ox_lib/init.lua'
}

client_scripts {
    'client/client.lua',
    'locales/*.lua',
    'config.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'locales/*.lua',
    'server/*.lua',
    'config.lua'
}
