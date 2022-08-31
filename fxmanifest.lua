fx_version 'cerulean'
games { 'gta5' }

author 'phant'
version '0.0.1'

client_scripts {
    'client/**/*.lua',
}
server_scripts {
    'server/**/*.lua',
    '@oxmysql/lib/MySQL.lua'
}
shared_scripts {
    'shared/**/*.lua',
}