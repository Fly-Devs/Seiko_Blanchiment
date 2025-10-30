fx_version 'adamant'
game 'gta5'

lua54 'yes'
discord 'https://discord.gg/DcDHfKJ7BT'

shared_script {
    'config.lua',
    '@es_extended/imports.lua',
    '@ox_lib/init.lua'
}

client_script {
    'client.lua'
}

server_script {
    'server.lua'
}

escrow_ignore {
    "config.lua"
}