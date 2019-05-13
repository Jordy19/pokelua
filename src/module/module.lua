--[[ The #pokelua Project.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License. ]]

-- Lua libs
require "libs"

-- We need tables.
db = {}
objects = setmetatable({}, {__newindex = table.newidx})
players_data = {}
admins = {}

-- Data lists.
require "lists.pokemon.first_generation"

-- Module files.
require "Translator"
require "events.new_player"
require "room"
require "object"
require "player"

function init()
    --[[ Inits the module. ]]
    -- Generate a random seed.
    math.randomseed(os.time())
    for k,v in pairs(tfm.get.room.playerList) do
        eventNewPlayer(k)
    end
    roomData = Room:init()
end