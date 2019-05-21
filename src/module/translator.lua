--[[ The #pokelua Project.
--
-- Licensed under the Apache License, Version 2.0 (the 'License');
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      https://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an 'AS IS' BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

Pokémon And All Respective Names are Trademark & © of Nintendo 1996-2019]]
tStrings = {}

tString = function(string)
    --[[ Translates strings to other languages.
    Defaults to EN community.

    Args:
        string: A string.

    Returns: A translated version of  input string.]]
    commu = tfm.get.room.community
    if tStrings[commu] and tStrings[commu][string] then
        t_string = tStrings[commu][string] or string.format('<font color="#CB546B">$string.%s.%s</font>', commu, string)
    else
        commu = 'en'
        t_string = tStrings[commu][string] or string.format('<font color="#CB546B">$string.%s.%s</font>', commu, string)
    end
    return t_string
 end

tStrings = {
    en = {
        infobar = '<p align="center"><j>PokeLua <bl>[<v>EN<bl>] • <font size="9"><bl>(<n>' ..
            'Version: <v>&version&<bl>)</font><font size="11"> <j>• <vp>!pikachu</font>' ..
            '<j>• <a href="event:explore.random"><font size="9"><bl>[<v>Random Pokémon<bl>]</font></a></p>',
        room_advice = 'Try !Pikachu',
        room_broadcast_global = '[Global] %s',
        room_broadcast_admin = '<font color="#EB1D51">~ [<b>A</b>]</font><font color="#CB2655"> %s</font>',
        room_admin_promotion = 'New room administrator: <b>%s</b>',
        room_admin_depromotion = 'Room admin removed: <b>%s</b>',
        commands_no_permission = 'Access denied: You have insufficient permissions.',

    },
    nl = {
        infobar = '<p align="center"><j>PokeLua <bl>[<v>NL<bl>] • <font size="9"><bl>(<n>Versie: <v>&version&<bl>)</font><font size="11"> <j>• <vp>!pikachu</font> <j>• <a href="event:explore.random"><font size="9"><bl>[<v>Willekeurige Pokémon<bl>]</font></a></p>',
    }
}
-- For international, e2 community we will fall back to EN.
tStrings.xx = tStrings.en
tStrings.e2 = tStrings.en