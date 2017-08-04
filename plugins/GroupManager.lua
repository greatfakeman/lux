--Begin GroupManager.lua By @sudoX
local function modadd(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
    if not is_admin(msg) then
   if not lang then
        return '*》**You are not admin** 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_'
else
     return '》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است.'
    end
end
    local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)] then
if not lang then
   return '》 **Group is already added sudoX** ‼️\n*〰〰〰〰〰〰〰〰*\n🗯_The robot is already in the group, the robot was is no longer need to do not_'
else
return '》 _ربات در_ #لیست _گروه ربات از قبل بود_ ‼️\n*〰〰〰〰〰〰〰〰*\n🗯ربات از قبل در لیست گروه های ربات بود است دیگر نیازی به این‌کار نیست.'
  end
end
        -- create data array in moderation.json
      data[tostring(msg.to.id)] = {
              owners = {},
      mods ={},
      banned ={},
      is_silent_users ={},
      filterlist ={},
      settings = {
          set_name = msg.to.title,
          lock_link = 'yes',
		  lock_join = 'no',
          lock_username = 'yes',
		  lock_hashtags = 'no',
          lock_spam = 'yes',
          lock_webpage = 'yes',
          lock_markdown = 'no',
		  lock_mention = 'no',
		  lock_arabic = 'no',
		  lock_edit = 'no',
          flood = 'yes',
          lock_bots = 'yes',
          lock_pin = 'no',
		  lock_tabchi = 'no',
          welcome = 'no',
				   english = 'no',
				   views = 'no',
				   emoji ='no',
				   ads = 'no',
				   fosh = 'no'
				   
          },
		  mute = {
		    mute_fwd = 'yes',
                  mute_audio = 'no',
                  mute_video = 'no',
                  mute_contact = 'yes',
                  mute_text = 'no',
                  mute_photos = 'no',
                  mute_gif = 'no',
                  mute_loc = 'no',
                  mute_doc = 'no',
                  mute_sticker = 'no',
                  mute_voice = 'no',
                   mute_all = 'no',
				   mute_keyboard = 'yes'
		  }
      }
 save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
    if not lang then
  return '》 **Group has been added sudoX** 💠\n*〰〰〰〰〰〰〰〰*\n🗯_Group now to list the groups the robot was added_'
else
  return '》 _گروه به_ #لیست _گروه ربات اضافه شده_ 💠\n*〰〰〰〰〰〰〰〰*\n🗯گروه هم اکنون به لیست گروه ربات اضافه شد.'
end
end

local function modrem(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    -- superuser and admins only (because sudo are always has privilege)
      if not is_admin(msg) then
     if not lang then
        return '*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_'
   else
        return '》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است.'
    end
   end
    local data = load_data(_config.moderation.data)
    local receiver = msg.to.id
  if not data[tostring(msg.to.id)] then
  if not lang then
    return '》 **Group is not added sudoX** 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_'
else
    return '》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.'
   end
  end

  data[tostring(msg.to.id)] = nil
  save_data(_config.moderation.data, data)
     local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
 if not lang then
  return '》 **Group has been remved** 💠\n*〰〰〰〰〰〰〰〰*\n🗯_The group now from the list of groups, the robot was removed_'
 else
  return '》 _گروه از_ #لیست _گروه های ربات حدف شد_ 💠\n*〰〰〰〰〰〰〰〰*\n🗯گروه هم اکنون از لیست گروه ربات حذف شد.'
end
end

 local function config_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
  print(serpent.block(data))
   for k,v in pairs(data.members_) do
   local function config_mods(arg, data)
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = v.user_id_
  }, config_mods, {chat_id=arg.chat_id,user_id=v.user_id_})
 
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
owner_id = v.user_id_
   local function config_owner(arg, data)
  print(serpent.block(data))
       local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    return
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   end
tdcli_function ({
    ID = "GetUser",
    user_id_ = owner_id
  }, config_owner, {chat_id=arg.chat_id,user_id=owner_id})
   end
end
  if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_All group admins has been promoted and group creator is now group owner_", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_تمام ادمین های گروه به مقام مدیر منتصب شدند و سازنده گروه به مقام مالک گروه منتصب شد_", 0, "md")
     end
 end
 
local function filter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
if data[tostring(msg.to.id)]['filterlist'][(word)] then
   if not lang then
         return "#》_ωøяκ_ *"..word.."* _łš αlяeαđч fłlтeяeđ_ ⚠️"
            else
         return "#》_کلمه_ *"..word.."* _از قبل فیلتر بود_⚠️"
    end
end
   data[tostring(msg.to.id)]['filterlist'][(word)] = true
     save_data(_config.moderation.data, data)
   if not lang then
         return "#》_ωøяκ_ *"..word.."* _αđđ тø fłlтeяeđ ωøяđš lłšт_ ✔️"
            else
         return "#》_کلمه_ *"..word.."* _به لیست کلمات فیلتر اضافه شد_✔️"
    end
end

local function unfilter_word(msg, word)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 local data = load_data(_config.moderation.data)
  if not data[tostring(msg.to.id)]['filterlist'] then
    data[tostring(msg.to.id)]['filterlist'] = {}
    save_data(_config.moderation.data, data)
    end
      if data[tostring(msg.to.id)]['filterlist'][word] then
      data[tostring(msg.to.id)]['filterlist'][(word)] = nil
       save_data(_config.moderation.data, data)
       if not lang then
         return "#》_ωøяκ_ *"..word.."* _яeмøνeđ fяαм fłlтeяeđ ωøяκ lłšт_ ❌"
       elseif lang then
         return "#》_کلمه_ *"..word.."* _از لیست کلمات فیلتر حذف شد_❌"
     end
      else
       if not lang then
         return "#》_ωøяκ_ *"..word.."* _łš иøт fłlтeяeđ_ ❗️"
       elseif lang then
         return "#》_کلمه_ *"..word.."* _از قبل فیلتر نبود_❗️"
      end
   end
end

local function modlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.chat_id_)] then
  if not lang then
    return "_Group is not added_"
 else
    return "گروه به لیست گروه های مدیریتی ربات اضافه نشده است"
  end
 end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['mods']) == nil then --fix way
  if not lang then
    return "_No_ *moderator* _in this group_"
else
   return "در حال حاضر هیچ مدیری برای گروه انتخاب نشده است"
  end
end
if not lang then
   message = '*List of moderators :*\n'
else
   message = '*لیست مدیران گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['mods'])
do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end

local function ownerlist(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
    local data = load_data(_config.moderation.data)
    local i = 1
  if not data[tostring(msg.to.id)] then
if not lang then
    return "_Group is not added_"
else
return "گروه به لیست گروه های مدیریتی ربات اضافه نشده است"
  end
end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['owners']) == nil then --fix way
 if not lang then
    return "_No_ *owner* _in this group_"
else
    return "در حال حاضر هیچ مالکی برای گروه انتخاب نشده است"
  end
end
if not lang then
   message = '*List of owners :*\n'
else
   message = '*لیست مالکین گروه :*\n'
end
  for k,v in pairs(data[tostring(msg.to.id)]['owners']) do
    message = message ..i.. '- '..v..' [' ..k.. '] \n'
   i = i + 1
end
  return message
end


local function action_by_reply(arg, data)
local hash = "gp_lang:"..data.chat_id_
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
if not tonumber(data.sender_user_id_) then return false end
    if data.sender_user_id_ then
  if not administration[tostring(data.chat_id_)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 **Group is not added sudoX** 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.", 0, "md")
     end
  end
  if cmd == "setmanager" then
local function manager_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *ادمین گروه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, manager_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "remmanager" then
local function rem_manager_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از ادمینی گروه برکنار شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_manager_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "setwhitelist" then
local function setwhitelist_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, setwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "remwhitelist" then
local function remwhitelist_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, remwhitelist_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
if cmd == "setowner" then
local function owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》 👤_υšeя _ : "..user_name.." *"..data.id.."* _łš αlяeαđч gяøυρ øωиeя_⚠️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر"..user_name.." *"..data.id_.."* *از قبل مدیر بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ øωиeя* ✔️", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *مدیر گروه شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "promote" then
local function promote_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš αlяeαđч_ *мøđeяαтøя*⚠️", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون گروه بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ ρяøмøтe*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *معاون گروه شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
     if cmd == "remowner" then
local function rem_owner_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *gяøυρ øωиeя*❌", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل مدیر نبود*❌", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš đeмøтe øf_ *gяøυρ øωиeя*✔️", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام مدیر برکنار شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, rem_owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "demote" then
local function demote_cb(arg, data)
    local administration = load_data(_config.moderation.data)
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *мøđeяαтøя*❗️", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون نبود*❗️", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ħαš вeeи_ *đeмøтeđ*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام معاون گروه برکنار شد*✔️", 0, "md")
   end
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
    if cmd == "id" then
local function id_cb(arg, data)
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
tdcli_function ({
    ID = "GetUser",
    user_id_ = data.sender_user_id_
  }, id_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
  end
else
    if lang then
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(data.chat_id_, "", 0, "", 0, "md")
      end
   end
end

local function action_by_username(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 *gяøυρ łš иøт αđđeđ* 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.", 0, "md")
     end
  end
if not arg.username then return false end
   if data.id_ then
if data.type_.user_.username_ then
user_name = '@'..check_markdown(data.type_.user_.username_)
else
user_name = check_markdown(data.title_)
end
if cmd == "setmanager" then
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *ادمین گروه شد*", 0, "md")
   end
end
if cmd == "remmanager" then
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از ادمینی گروه برکنار شد*", 0, "md")
   end
 end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
if cmd == "setowner" then
if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》 _υšeя _ 👤: "..user_name.."\n łđ : *"..data.id.."* _łš αlяeαđч gяøυρ øωиeя-⚠️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر"..user_name.." *"..data.id_.."* *از قبل مدیر بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ øωиeя* ✔️", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *مدیر گروه شد*✔️", 0, "md")   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš αlяeαđч_ *мøđeяαтøя*⚠️", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون گروه بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _нαѕ вєєη_ *ρяσмσтє∂*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *معاون گروه شد*✔️", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ιѕ ησт α_ *gяøυρ øωиeя*❌", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل مدیر نبود*❌", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš đeмøтe øf_ *gяøυρ øωиeя*✔️", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام مدیر برکنار شد*✔️", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *мøđeяαтøя*❗️", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون نبود*❗️", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ħαš вeeи_ *đeмøтeđ*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام معاون گروه برکنار شد*✔️", 0, "md")
   end
end
   if cmd == "id" then
    return tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
end
    if cmd == "res" then
    if not lang then
     text = "》 *яešυlт føя*📄 [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. ""..check_markdown(data.title_).."\n"
    .. " ["..data.id_.."]"
  else
     text = "》 _اطلاعات برای_📄 [ "..check_markdown(data.type_.user_.username_).." ] :\n"
    .. "".. check_markdown(data.title_) .."\n"
    .. " [".. data.id_ .."]"
         end
       return tdcli.sendMessage(arg.chat_id, 0, 1, text, 1, 'md')
   end
else
    if lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
      end
   end
end

local function action_by_id(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
local cmd = arg.cmd
    local administration = load_data(_config.moderation.data)
  if not administration[tostring(arg.chat_id)] then
  if not lang then
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 *gяøυρ łš иøт αđđeđ* 🚫\n*〰〰〰〰〰〰〰〰*\n🗯_Group from the first to the group list, the robot was not added_", 0, "md")
else
    return tdcli.sendMessage(data.chat_id_, "", 0, "》 _گروه در_ #لیست _گروه ربات  نیست_ 🚫\n*〰〰〰〰〰〰〰〰*\n🗯گروه از اول به لیست گروه ربات اضافه نشده بود.", 0, "md")
     end
  end
if not tonumber(arg.user_id) then return false end
   if data.id_ then
if data.first_name_ then
if data.username_ then
user_name = '@'..check_markdown(data.username_)
else
user_name = check_markdown(data.first_name_)
end
if cmd == "setmanager" then
  channel_set_admin(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is now the_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *ادمین گروه شد*", 0, "md")
   end
end
if cmd == "remmanager" then
  channel_demote(arg.chat_id, data.id_)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is no longer_ *group manager*", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از ادمینی گروه برکنار شد*", 0, "md")
   end
 end
    if cmd == "setwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is already in_ *white list*", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید بود*", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been added to_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *به لیست سفید اضافه شد*", 0, "md")
   end
end
    if cmd == "remwhitelist" then
  if not administration[tostring(arg.chat_id)]['whitelist'] then
    administration[tostring(arg.chat_id)]['whitelist'] = {}
    save_data(_config.moderation.data, administration)
    end
if not administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _is not in_ *white list*", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از قبل در لیست سفید نبود*", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['whitelist'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "_User_ "..user_name.." *"..data.id_.."* _has been removed from_ *white list*", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "_کاربر_ "..user_name.." *"..data.id_.."* *از لیست سفید حذف شد*", 0, "md")
   end
end
  if cmd == "setowner" then
  if administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》 _υšeя _ 👤: "..user_name.."\n łđ : *"..data.id.."* _łš αlяeαđч gяøυρ øωиeя-⚠️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر"..user_name.." *"..data.id_.."* *از قبل مدیر بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøω тħe_ *gяøυρ øωиeя* ✔️", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *مدیر گروه شد*✔️", 0, "md")   end
   end
end
  if cmd == "promote" then
if administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš αlяeαđч_ *мøđeяαтøя*⚠️", 0, "md")
else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون گروه بود*⚠️", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = user_name
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _нαѕ вєєη_ *ρяσмσтє∂*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *معاون گروه شد*✔️", 0, "md")
   end
end
   if cmd == "remowner" then
if not administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] then
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ιѕ ησт α_ *gяøυρ øωиeя*❌", 0, "md")
   else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل مدیر نبود*❌", 0, "md")
      end
   end
administration[tostring(arg.chat_id)]['owners'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łš đeмøтe øf_ *gяøυρ øωиeя*✔️", 0, "md")
    else
return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام مدیر برکنار شد*✔️", 0, "md")
   end
end
   if cmd == "demote" then
if not administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] then
    if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _łи иøт α_ *мøđeяαтøя*❗️", 0, "md")
    else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از قبل معاون نبود*❗️", 0, "md")
   end
  end
administration[tostring(arg.chat_id)]['mods'][tostring(data.id_)] = nil
    save_data(_config.moderation.data, administration)
   if not lang then
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤_υšeя_ "..user_name.." *"..data.id_.."* _ħαš вeeи_ *đeмøтeđ*✔️", 0, "md")
   else
    return tdcli.sendMessage(arg.chat_id, "", 0, "》👤کاربر "..user_name.." *"..data.id_.."* *از مقام معاون گروه برکنار شد*✔️", 0, "md")
   end
end
    if cmd == "whois" then
if data.username_ then
username = '@'..check_markdown(data.username_)
else
if not lang then
username = '》 *иøт føυиđ❗️*'
 else
username = '》 _ندارد❗️_'
  end
end
     if not lang then
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'Iηƒσ ƒσя📃 [ '..data.id_..' ] :\n👤υšeяNαмє : '..username..'\n💎Nαмє : '..data.first_name_, 1)
   else
       return tdcli.sendMessage(arg.chat_id, 0, 1, 'اطلاعات برای📃  [ '..data.id_..' ] :\n👤یوزرنیم : '..username..'\n💎نام : '..data.first_name_, 1)
      end
   end
 else
    if not lang then
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
   else
  return tdcli.sendMessage(arg.chat_id, "", 0, "", 0, "md")
    end
  end
end

local function delmsg (luxury,sudoX)
    msgs = luxury.msgs 
    for k,v in pairs(sudoX.messages_) do
        msgs = msgs - 1
        tdcli.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tdcli.deleteMessages(sudoX.messages_[0].chat_id_,{[0] = sudoX.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tdcli.getChatHistory(sudoX.messages_[0].chat_id_, sudoX.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end

---------------Lock Link-------------------
local function lock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_link = data[tostring(target)]["settings"]["lock_link"] 
if lock_link == "yes" then
if not lang then
 return "》*#lø¢κ* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "》ارسال #لینک در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
data[tostring(target)]["settings"]["lock_link"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "》*#lø¢κ* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "》ارسال #لینک در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_link(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_link = data[tostring(target)]["settings"]["lock_link"]
 if lock_link == "no" then
if not lang then
return "》*#lø¢κ* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "》ارسال #لینک در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_link"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "》*#lø¢κ* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "》ارسال #لینک در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Join-------------------
local function lock_join(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "_You're Not_ *Moderator*"
else
 return "شما مدیر گروه نمیباشید"
end
end

local lock_join = data[tostring(target)]["settings"]["lock_join"] 
if lock_join == "yes" then
if not lang then
 return "*Lock Join* _Is Already Locked_"
elseif lang then
 return "ورود به گروه هم اکنون ممنوع است"
end
else
 data[tostring(target)]["settings"]["lock_join"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*Lock Join* _Has Been Locked_"
else
 return "ورود به گروه ممنوع شد"
end
end
end

local function unlock_join(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "_You're Not_ *Moderator*"
else
return "شما مدیر گروه نمیباشید"
end 
end

local lock_join = data[tostring(target)]["settings"]["lock_join"]
 if lock_join == "no" then
if not lang then
return "*Lock Join* _Is Not Locked_" 
elseif lang then
return "ورود به گروه ممنوع نمیباشد"
end
else 
data[tostring(target)]["settings"]["lock_join"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*Lock Join* _Has Been Unlocked_" 
else
return "ورود به گروه آزاد شد"
end
end
end

---------------Lock username-------------------
local function lock_username(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_username = data[tostring(target)]["settings"]["lock_username"] 
if lock_username == "yes" then
if not lang then
 return "》*#υšeяиαмe* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "》ارسال #یوزرنیم در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_username"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "》*#υšeяиαмe* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "》ارسال #یوزرنیم در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_username(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_username = data[tostring(target)]["settings"]["lock_username"]
 if lock_username == "no" then
if not lang then
return "》*#υšeяиαмe* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "》ارسال #یوزرنیم در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_username"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "》*#υšeяиαмe* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "》ارسال #یوزرنیم در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock hashtags-------------------
local function lock_hashtags(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_hashtags = data[tostring(target)]["settings"]["lock_hashtags"] 
if lock_hashtags == "yes" then
if not lang then
 return "》*#ħαšħтαg* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "》ارسال #هشتگ و یوزرنیم در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_hashtags"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "》*#ħαšħтαg* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "》ارسال #هشتگ در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_hashtags(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_hashtags = data[tostring(target)]["settings"]["lock_hashtags"]
 if lock_hashtags == "no" then
if not lang then
return "》*#ħαšħтαg* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
return "》ارسال #هشتگ در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_hashtags"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "》*#ħαšħтαg* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "》ارسال #هشتگ درگروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Vewis-------------------
local function lock_views(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_views = data[tostring(target)]["settings"]["views"] 
if lock_views == "yes" then
if not lang then
 return "#νłeωš _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #پست ویو دار در گروه هم اکنون ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["views"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "#νłeωš _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #پست ویو دار در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_views(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_views = data[tostring(target)]["settings"]["views"]
 if lock_views == "no" then
if not lang then
return "#νłeωš _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "ارسال #پست ویو دار در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\n🗯ارسال ویو از قبل ممنوع نبود و پست های داری ویو پاک نمیشدند.\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["views"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "#νłeωš _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #پست ویو دار در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock English-------------------
local function lock_english(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_english = data[tostring(target)]["settings"]["english"] 
if lock_english == "yes" then
if not lang then
 return "*#eиglłšħ* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "نوشته #انگلیسی در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["english"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#eиglłšħ* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "نوشته انگلیسی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_english(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_english = data[tostring(target)]["settings"]["english"]
 if lock_english == "no" then
if not lang then
return "*#eиglłšħ* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
return "نوشته انگلیسی در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["english"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#eиglłšħ* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "نوشته انگلیسی در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Emoji-------------------
local function lock_emoji(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"] 
if lock_emoji == "yes" then
if not lang then
 return "*#eмøנł* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "نوشته #ایموجی در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["emoji"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#eмøנł* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "نوشته #ایموجی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_emoji(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_emoji = data[tostring(target)]["settings"]["emoji"]
 if lock_emoji == "no" then
if not lang then
return "*#eмøנł* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
return "نوشته #ایموجی در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["emoji"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#eмøנł* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "نوشته #ایموجی در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Ads-------------------
local function lock_ads(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_ads = data[tostring(target)]["settings"]["ads"] 
if lock_ads == "yes" then
if not lang then
 return "*#αđš* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #تبلیغات در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["ads"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*@αđš* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #تبلیغات در گروه ممنوع شد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_ads(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_ads = data[tostring(target)]["settings"]["ads"]
 if lock_ads == "no" then
if not lang then
return "*#αđš* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
return "ارسال #تبلیغات در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["ads"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#αđš* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #تبلیغات در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Fosh-------------------
local function lock_fosh(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_fosh = data[tostring(target)]["settings"]["fosh"] 
if lock_fosh == "yes" then
if not lang then
 return "#føšħ _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #کلمات رکیک در گروه هم اکنون ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["fosh"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "#føšħ _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #کلمات رکیک در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_fosh(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_fosh = data[tostring(target)]["settings"]["fosh"]
 if lock_fosh == "no" then
if not lang then
return "#føšħ _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "ارسال #کلمات رکیک در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["fosh"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "#føšħ _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #کلمات رکیک در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Mention-------------------
local function lock_mention(msg, data, target)
 local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_mention = data[tostring(target)]["settings"]["lock_mention"] 
if lock_mention == "yes" then
if not lang then
 return "*#мeитłøи* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #فراخوانی در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_mention"] = "yes"
save_data(_config.moderation.data, data)
if not lang then 
 return "*#мeитłøи* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else 
 return "ارسال #فراخوانی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_mention(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_mention = data[tostring(target)]["settings"]["lock_mention"]
 if lock_mention == "no" then
if not lang then
return "*#мeитłøи* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
return "ارسال #فراخوانی در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_mention"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#мeитłøи* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #فراخوانی در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

---------------Lock Arabic--------------
local function lock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"] 
if lock_arabic == "yes" then
if not lang then
 return "*#αяαвł¢* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #کلمات فارسی در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
data[tostring(target)]["settings"]["lock_arabic"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#αяαвł¢* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #کلمات فارسی در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_arabic(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_arabic = data[tostring(target)]["settings"]["lock_arabic"]
 if lock_arabic == "no" then
if not lang then
return "*#αяαвł¢* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
return "ارسال #کلمات فارسی در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_arabic"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#αяαвł¢* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #کلمات فارسی در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Edit-------------------
local function lock_edit(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_edit = data[tostring(target)]["settings"]["lock_edit"] 
if lock_edit == "yes" then
if not lang then
 return "*#eđłтłиg* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "قفل #ویرایش پیام در گروه  از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_edit"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#eđłтłиg* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "قفل #ویرایش پیام در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_edit(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_edit = data[tostring(target)]["settings"]["lock_edit"]
 if lock_edit == "no" then
if not lang then
return "*#eđłтłиg* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "قفل #ویرایش پیام در گروه از قبل ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_edit"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#eđłтłиg* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "قفل #ویرایش پیام در گروه ازاد است🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock spam-------------------
local function lock_spam(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_spam = data[tostring(target)]["settings"]["lock_spam"] 
if lock_spam == "yes" then
if not lang then
 return "*#šραм* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #هرزنامه ( اسپم) در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_spam"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#šραм* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #هرزنامه ( اسپم) در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_spam(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_spam = data[tostring(target)]["settings"]["lock_spam"]
 if lock_spam == "no" then
if not lang then
return "*#šραм* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"  
elseif lang then
 return "ارسال #هرزنامه (اسپم) در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_spam"] = "no" 
save_data(_config.moderation.data, data)
if not lang then 
return "*#šραм* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
 return "ارسال #هرزنامه (اسپم) در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Flood-------------------
local function lock_flood(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_flood = data[tostring(target)]["settings"]["flood"] 
if lock_flood == "yes" then
if not lang then
 return "*#fløøđłиg* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #پیام مکرر در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["flood"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#fløøđłиg* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال # پیام مکرر در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_flood(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_flood = data[tostring(target)]["settings"]["flood"]
 if lock_flood == "no" then
if not lang then
return "*#fløøđłиg* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "ارسال #پیام مکرر در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["flood"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#fløøđłиg*  _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #پیام مکرر در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Bots-------------------
local function lock_bots(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"] 
if lock_bots == "yes" then
if not lang then
 return "*#вøт* _ρяøтe¢тłøи łš αlяeαđч eиαвleđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "#محافظت از گروه در برابر ربات ها از قبل فعال است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_bots"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#вøт* _ρяøтe¢тłøи øи ħαš вeeи eиαвleđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "#محافظت از گروه در برابر ربات ها  فعال شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_bots(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_bots = data[tostring(target)]["settings"]["lock_bots"]
 if lock_bots == "no" then
if not lang then
return "*#вøт* _ρяøтe¢тłøи łš иøт đłšαвleđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "محافظت از گروه در برابر ربات ها غیر فعال است\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_bots"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#вøт* _ρяøтe¢тłøи ħαš вeeи đłšαвleđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "#محافظت از گروه در برابر ربات ها  ازاد است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Markdown-------------------
local function lock_markdown(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"] 
if lock_markdown == "yes" then
if not lang then 
 return "*#мαяκđøωи* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #پیام دارای فونت در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_markdown"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мαяκđøωи* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #پیام دارای فونت در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_markdown(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_markdown = data[tostring(target)]["settings"]["lock_markdown"]
 if lock_markdown == "no" then
if not lang then
return "*#мαяκđøωи* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "ارسال #پیام دارای فونت در گروه  از قبلا ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_markdown"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#мαяκđøωи* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "ارسال #پیام درای فونت در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Webpage-------------------
local function lock_webpage(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"] 
if lock_webpage == "yes" then
if not lang then
 return "*#ωel¢øмe* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "ارسال #صفحات وب در گروه  از قبلا ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_webpage"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#ωel¢øмe* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "ارسال #صفحات وب در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_webpage(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_webpage = data[tostring(target)]["settings"]["lock_webpage"]
 if lock_webpage == "no" then
if not lang then
return "*#ωel¢øмe* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "ارسال #صفحات وب در گروه  از قبل ممنوع نیست🔓\n*〰〰〰〰〰〰〰〰*\n🗯سفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_webpage"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*#ωel¢øмe* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "ارسال #صفحات وب در گروه  ازاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Lock Pin-------------------
local function lock_pin(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"] 
if lock_pin == "yes" then
if not lang then
 return "*#ρłииeđ мeššαge* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "سنجاق کردن پیام در گروه از قبل ممنوع است🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["lock_pin"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#ρłииeđ мeššαge* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "سنجاق کردن پیام در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_pin(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local lock_pin = data[tostring(target)]["settings"]["lock_pin"]
 if lock_pin == "no" then
if not lang then
return "*#ρłииeđ мeššαge* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "سنجاق کردن پیام در گروه ممنوع نمیباشد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_pin"] = "no"
save_data(_config.moderation.data, data) 
if not lang then
return "*#ρłииeđ мeššαge* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "سنجاق کردن پیام در گروه آزاد شد🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
--------------Lock Tabchi-------------
local function lock_tabchi(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local lock_tabchi = data[tostring(target)]["settings"]["lock_tabchi"] 
if lock_tabchi == "yes" then
if not lang then
 return "*#тαв¢ħł* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "اوردن تبچی در گروه هم اکنون ممنوع است\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
data[tostring(target)]["settings"]["lock_tabchi"] = "yes"
save_data(_config.moderation.data, data) 
if not lang then
 return "*#тαв¢ħł* _ρøšтłиg ħαš вeeи lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "اوردن تبچی در گروه ممنوع شد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unlock_tabchi(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local lock_tabchi = data[tostring(target)]["settings"]["lock_tabchi"]
 if lock_tabchi == "no" then
if not lang then
return "*#тαв¢ħł* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "اوردن تبچی در گروه ممنوع نمیباشد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["lock_tabchi"] = "no" save_data(_config.moderation.data, data) 
if not lang then
return "*#тαв¢ħł* _ρøšтłиg ħαš вeeи υиlø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "اوردن تبچی در گروه آزاد شد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

--------Mutes---------
---------------Mute Gif-------------------
local function mute_gif(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_gif = data[tostring(target)]["settings"]["mute_gif"] 
if mute_gif == "yes" then
if not lang then
 return "*#мυтe głf* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #تصاویر متحرک  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_gif"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then 
 return "*#мυтe głf* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #تصاویر متحرک فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_gif(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_gif = data[tostring(target)]["settings"]["mute_gif"]
 if mute_gif == "no" then
if not lang then
return "*#мυтe głf* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #تصاویر متحرک فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_gif"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe głf* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن # تصاویر متحرک غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Game-------------------
local function mute_game(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_game = data[tostring(target)]["settings"]["mute_game"] 
if mute_game == "yes" then
if not lang then
 return "*#мυтe gαмe* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #بازی های تحت وب  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_game"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe gαмe* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #بازی های تحت وب   فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_game(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_game = data[tostring(target)]["settings"]["mute_game"]
 if mute_game == "no" then
if not lang then
return "*#мυтe gαмe* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #بازی های تحت وب   فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_game"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe gαмe* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #بازی های تحت وب  غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Inline-------------------
local function mute_inline(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_inline = data[tostring(target)]["settings"]["mute_inline"] 
if mute_inline == "yes" then
if not lang then
 return "*#мυтe łиlłиe* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #کیبورد شیشه ای از قبل فعال است🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_inline"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe łиlłиe* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #کیبورد شیشه ای فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_inline(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_inline = data[tostring(target)]["settings"]["mute_inline"]
 if mute_inline == "no" then
if not lang then
return "*#мυтe łиlłиe* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #کیبورد شیشه ای فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_inline"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe łиlłиe* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #کیبورد شیشه ای  غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Text-------------------
local function mute_text(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_text = data[tostring(target)]["settings"]["mute_text"] 
if mute_text == "yes" then
if not lang then
 return "*#мυтe тeχт* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #متن  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_text"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe тeχт* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #متن فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_text(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_text = data[tostring(target)]["settings"]["mute_text"]
 if mute_text == "no" then
if not lang then
return "*#мυтe тeχт* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
return "بیصدا کردن # متن فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]" 
end
else 
data[tostring(target)]["settings"]["mute_text"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe тeχт* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن # متن غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute photo-------------------
local function mute_photo(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_photo = data[tostring(target)]["settings"]["mute_photo"] 
if mute_photo == "yes" then
if not lang then
 return "*#мυтe ρħøтø* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #عکس  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_photo"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe ρħøтø* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #عکس فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_photo(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end
 
local mute_photo = data[tostring(target)]["settings"]["mute_photo"]
 if mute_photo == "no" then
if not lang then
return "*#мυтe ρħøтø* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #عکس فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_photo"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe ρħøтø* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن # عکس غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Video-------------------
local function mute_video(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_video = data[tostring(target)]["settings"]["mute_video"] 
if mute_video == "yes" then
if not lang then
 return "*#мυтe νłđeø* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #ویدیو  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_video"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then 
 return "*#мυтe νłđeø* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #ویدیو فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_video(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_video = data[tostring(target)]["settings"]["mute_video"]
 if mute_video == "no" then
if not lang then
return "*#мυтe νłđeø* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #ویدیو فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_video"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe νłđeø* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #ویدیو غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Audio-------------------
local function mute_audio(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_audio = data[tostring(target)]["settings"]["mute_audio"] 
if mute_audio == "yes" then
if not lang then
 return "*#мυтe αυđłø* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #اهنگ  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_audio"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe αυđłø* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else 
return "بیصدا کردن #اهنگ فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_audio(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_audio = data[tostring(target)]["settings"]["mute_audio"]
 if mute_audio == "no" then
if not lang then
return "*#мυтe αυđłø* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #اهنگ فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_audio"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe αυđłø* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "بیصدا کردن #اهنگ غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]" 
end
end
end
---------------Mute Voice-------------------
local function mute_voice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_voice = data[tostring(target)]["settings"]["mute_voice"] 
if mute_voice == "yes" then
if not lang then
 return "*#мυтe νøł¢e* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #صدا (وویس)  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_voice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe νøł¢e* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #صدا (وویس)  فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_voice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_voice = data[tostring(target)]["settings"]["mute_voice"]
 if mute_voice == "no" then
if not lang then
return "*#мυтe νøł¢e* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #صدا (وویس) فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_voice"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe νøł¢e* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #صدا (وویس) غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Sticker-------------------
local function mute_sticker(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"] 
if mute_sticker == "yes" then
if not lang then
 return "*#мυтe šтł¢κeя* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #استیکر  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_sticker"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe šтł¢κeя* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #استیکر فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_sticker(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_sticker = data[tostring(target)]["settings"]["mute_sticker"]
 if mute_sticker == "no" then
if not lang then
return "*#мυтe šтł¢κeя* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #استیکر فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_sticker"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe šтł¢κeя* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "بیصدا کردن #استیکر غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end 
end
end
---------------Mute Contact-------------------
local function mute_contact(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_contact = data[tostring(target)]["settings"]["mute_contact"] 
if mute_contact == "yes" then
if not lang then
 return "*#мυтe ¢øитα¢т* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #ارسال مخاطب  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_contact"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe ¢øитα¢т* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #ارسال مخاطب فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_contact(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_contact = data[tostring(target)]["settings"]["mute_contact"]
 if mute_contact == "no" then
if not lang then
return "*#мυтe ¢øитα¢т* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #ارسال مخطب فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_contact"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe ¢øитα¢т* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #ارسال مخاطب غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Forward-------------------
local function mute_forward(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_forward = data[tostring(target)]["settings"]["mute_forward"] 
if mute_forward == "yes" then
if not lang then
 return "*#мυтe føяωαяđ* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #فوروارد از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_forward"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe føяωαяđ* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #فوروارد فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_forward(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_forward = data[tostring(target)]["settings"]["mute_forward"]
 if mute_forward == "no" then
if not lang then
return "*#мυтe føяωαяđ* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
return "بیصدا کردن #فوروارد فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end 
else 
data[tostring(target)]["settings"]["mute_forward"] = "no"
 save_data(_config.moderation.data, data)
if not lang then 
return "*#мυтe føяωαяđ* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #فوروارد غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Location-------------------
local function mute_location(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_location = data[tostring(target)]["settings"]["mute_location"] 
if mute_location == "yes" then
if not lang then
 return "*#мυтe lø¢αтłøи* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #موقعیت  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_location"] = "yes" 
save_data(_config.moderation.data, data)
if not lang then
 return "*#мυтe lø¢αтłøи* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #موقعیت فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_location(msg, data, target)
local hash = "gp_lang:"..msg.chat_id_
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_location = data[tostring(target)]["settings"]["mute_location"]
 if mute_location == "no" then
if not lang then
return "*#мυтe lø¢αтłøи* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #موقعیت فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_location"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe lø¢αтłøи* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #موقعیت غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute Document-------------------
local function mute_document(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_document = data[tostring(target)]["settings"]["mute_document"] 
if mute_document == "yes" then
if not lang then
 return "*#мυтe đø¢υмeит* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #اسناد  از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_document"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe đø¢υмeит* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
 return "بیصدا کردن #اسناد فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_document(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end 

local mute_document = data[tostring(target)]["settings"]["mute_document"]
 if mute_document == "no" then
if not lang then
return "*#мυтe đø¢υмeит* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
elseif lang then
return "بیصدا کردن #اسناد فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else 
data[tostring(target)]["settings"]["mute_document"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe đø¢υмeит* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
else
return "بیصدا کردن #اسناد غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end
---------------Mute TgService-------------------
local function mute_tgservice(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_tgservice = data[tostring(target)]["settings"]["mute_tgservice"] 
if mute_tgservice == "yes" then
if not lang then
 return "*#мυтe тgšeяνł¢e* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن #خدمات تلگرام از قبل فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_tgservice"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe тgšeяνł¢e* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "بیصدا کردن #خدمات تلگرام  فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_tgservice(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_tgservice = data[tostring(target)]["settings"]["mute_tgservice"]
 if mute_tgservice == "no" then
if not lang then
return "*#мυтe тgšeяνł¢e* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
return "بیصدا کردن #خدمات تلگرام فعال نیست🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end 
else 
data[tostring(target)]["settings"]["mute_tgservice"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe тgšeяνł¢e* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "بیصدا کردن #خدمات تلگرام  غیرفعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end 
end
end

---------------Mute Keyboard-------------------
local function mute_keyboard(msg, data, target) 
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end

local mute_keyboard = data[tostring(target)]["settings"]["mute_keyboard"] 
if mute_keyboard == "yes" then
if not lang then
 return "*#мυтe κeчвøαяđ* _łš αlяeαđч eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
 return "بیصدا کردن صفحه کلید فعال است🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
else
 data[tostring(target)]["settings"]["mute_keyboard"] = "yes" 
save_data(_config.moderation.data, data) 
if not lang then
 return "*#мυтe κeчвøαяđ* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "بیصدا کردن صفحه کلید فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
end

local function unmute_keyboard(msg, data, target)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if not is_mod(msg) then
if not lang then
return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_"
else
return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end 
end

local mute_keyboard = data[tostring(target)]["settings"]["mute_keyboard"]
 if mute_keyboard == "no" then
if not lang then
return "*#мυтe κeчвøαяđ* _łš иøт đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
return "بیصدا کردن صفحه کلید غیرفعال است🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end 
else 
data[tostring(target)]["settings"]["mute_keyboard"] = "no"
 save_data(_config.moderation.data, data) 
if not lang then
return "*#мυтe κeчвøαяđ* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
else
return "بیصدا کردن صفحه کلید غیرفعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end 
end
end
----------Settings---------
local function group_settings(msg, target) 	
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if not is_mod(msg) then
if not lang then
 return "*》γσų ąŗε ŋσŧ ɓσŧ ąđɱïŋ 🚷*\n*〰〰〰〰〰〰〰〰*\n🗯_Run this command only for Admins and deputies is_" 
else
 return "》 _شما_ #مدیر _گروه نیستید_ 🚷\n*〰〰〰〰〰〰〰〰*\n🗯اجرای این دستور فقط برای مدیران و معاونان است."
end
end
local data = load_data(_config.moderation.data)
local target = msg.to.id 
if data[tostring(target)] then 	
if data[tostring(target)]["settings"]["num_msg_max"] then 	
NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
	print('custom'..NUM_MSG_MAX) 	
else 	
NUM_MSG_MAX = 5
end
if data[tostring(target)]["settings"]["set_char"] then 	
SETCHAR = tonumber(data[tostring(target)]['settings']['set_char'])
	print('custom'..SETCHAR) 	
else 	
SETCHAR = 40
end
if data[tostring(target)]["settings"]["time_check"] then 	
TIME_CHECK = tonumber(data[tostring(target)]['settings']['time_check'])
	print('custom'..TIME_CHECK) 	
else 	
TIME_CHECK = 2
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_link"] then			
data[tostring(target)]["settings"]["lock_link"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_join"] then			
data[tostring(target)]["settings"]["lock_join"] = "no"		
end
end
 
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_username"] then			
data[tostring(target)]["settings"]["lock_username"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_hashtags"] then			
data[tostring(target)]["settings"]["lock_hashtags"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["emoji"] then			
data[tostring(target)]["settings"]["emoji"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_mention"] then			
data[tostring(target)]["settings"]["lock_mention"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_arabic"] then			
data[tostring(target)]["settings"]["lock_arabic"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_edit"] then			
data[tostring(target)]["settings"]["lock_edit"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_spam"] then			
data[tostring(target)]["settings"]["lock_spam"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_flood"] then			
data[tostring(target)]["settings"]["lock_flood"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_bots"] then			
data[tostring(target)]["settings"]["lock_bots"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["english"] then			
data[tostring(target)]["settings"]["english"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["views"] then			
data[tostring(target)]["settings"]["views"] = "yes"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_markdown"] then			
data[tostring(target)]["settings"]["lock_markdown"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["ads"] then			
data[tostring(target)]["settings"]["ads"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["fosh"] then			
data[tostring(target)]["settings"]["fosh"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["lock_webpage"] then			
data[tostring(target)]["settings"]["lock_webpage"] = "no"		
end
end

if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["welcome"] then			
data[tostring(target)]["settings"]["welcome"] = "no"		
end
end

 if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_pin"] then			
 data[tostring(target)]["settings"]["lock_pin"] = "no"		
 end
 end
 
  if data[tostring(target)]["settings"] then		
 if not data[tostring(target)]["settings"]["lock_tabchi"] then			
 data[tostring(target)]["settings"]["lock_tabchi"] = "no"		
 end
 end
 
local data = load_data(_config.moderation.data)
local target = msg.to.id
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_all"] then			
data[tostring(target)]["settings"]["mute_all"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_gif"] then			
data[tostring(target)]["settings"]["mute_gif"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_text"] then			
data[tostring(target)]["settings"]["mute_text"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_photo"] then			
data[tostring(target)]["settings"]["mute_photo"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_video"] then			
data[tostring(target)]["settings"]["mute_video"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_audio"] then			
data[tostring(target)]["settings"]["mute_audio"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_voice"] then			
data[tostring(target)]["settings"]["mute_voice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_sticker"] then			
data[tostring(target)]["settings"]["mute_sticker"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_contact"] then			
data[tostring(target)]["settings"]["mute_contact"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_forward"] then			
data[tostring(target)]["settings"]["mute_forward"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_location"] then			
data[tostring(target)]["settings"]["mute_location"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_document"] then			
data[tostring(target)]["settings"]["mute_document"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_tgservice"] then			
data[tostring(target)]["settings"]["mute_tgservice"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_inline"] then			
data[tostring(target)]["settings"]["mute_inline"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_game"] then			
data[tostring(target)]["settings"]["mute_game"] = "no"		
end
end
if data[tostring(target)]["settings"] then		
if not data[tostring(target)]["settings"]["mute_keyboard"] then			
data[tostring(target)]["settings"]["mute_keyboard"] = "no"		
end
end
 local expire_date = ''
local expi = redis:ttl('ExpireDate:'..msg.to.id)
if expi == -1 then
if lang then
	expire_date = 'نــامحــدود'
else
	expire_date = 'Unlimited!'
end
else
	local day = math.floor(expi / 86400) + 1
if lang then
	expire_date = day..' روز'
else
	expire_date = day..' Days'
end
end
local cmdss = redis:hget('group:'..msg.to.id..':cmd', 'bot')
	local cmdsss = ''
	if lang then
	if cmdss == 'owner' then
	cmdsss = cmdsss..'مالــک و بالـاتر'
	elseif cmdss == 'moderator' then
	cmdsss = cmdsss..'مــدیر و بالـاتر'
	else
	cmdsss = cmdsss..'کــاربر و بالـاتر'
	end
	else
	if cmdss == 'owner' then
	cmdsss = cmdsss..'Owner or higher'
	elseif cmdss == 'moderator' then
	cmdsss = cmdsss..'Moderator or higher'
	else
	cmdsss = cmdsss..'Member or higher'
	end
	end
local hash = "muteall:"..msg.to.id
local check_time = redis:ttl(hash)
day = math.floor(check_time / 86400)
bday = check_time % 86400
hours = math.floor( bday / 3600)
bhours = bday % 3600
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if not lang then
if not redis:get(hash) or check_time == -1 then
 mute_all1 = 'no'
elseif tonumber(check_time) > 1 and check_time < 60 then
 mute_all1 = '_enable for_ *'..sec..'* _sec_'
elseif tonumber(check_time) > 60 and check_time < 3600 then
 mute_all1 = '_enable for_ '..min..' _min_ *'..sec..'* _sec_'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
 mute_all1 = '_enable for_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
elseif tonumber(check_time) > 86400 then
 mute_all1 = '_enable for_ *'..day..'* _day_ *'..hours..'* _hour_ *'..min..'* _min_ *'..sec..'* _sec_'
 end
elseif lang then
if not redis:get(hash) or check_time == -1 then
 mute_all2 = 'no'
elseif tonumber(check_time) > 1 and check_time < 60 then
 mute_all2 = '_فعال برای_ *'..sec..'* _ثانیه_'
elseif tonumber(check_time) > 60 and check_time < 3600 then
 mute_all2 = '_فعال برای_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه_'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
 mute_all2 = '_فعال برای_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه_'
elseif tonumber(check_time) > 86400 then
 mute_all2 = '_فعال برای_ *'..day..'* _روز و_ *'..hours..'* _ساعت و_ *'..min..'* _دقیقه و_ *'..sec..'* _ثانیه_'
 end
end
if not lang then
local settings = data[tostring(target)]["settings"] 
 text ="*gяσυρ ѕєттιηgѕ яα∂ιкαℓвσт :*\n*_______________*\n`🔐 GroUo Lock List :`\n●*》ℓσ¢к ̶є∂ιтє :* "..settings.lock_edit.."\n○*》ℓσ¢к ̶ℓιηк :* "..settings.lock_link.."\n●*》ℓσ¢к ̶υѕєяηαмє :* "..settings.lock_username.."\n○*》ℓσ¢к ̶нαѕнтαgѕ :* "..settings.lock_hashtags.."\n●*》ℓσ¢к ємσנι :* "..settings.emoji.."\n○*》ℓσ¢к  ̶נσιη ̶ :* "..settings.lock_join.."\n●*》ℓσ¢к тαв¢нι :* "..settings.lock_tabchi.."\n○*》ℓσ¢к ѕραм :* "..settings.lock_spam.."\n●*》ℓσ¢к ƒℓσσ∂ :* "..settings.flood.."\n○*》ℓσ¢к ̶ƒσѕн :* "..settings.fosh.."\n●*》ℓσ¢к ̶мєηтιση :* "..settings.lock_mention.."\n○*》ℓσ¢к ωєвραgє :* "..settings.lock_webpage.."\n●*》ℓσ¢к ̶α∂ѕ  :* "..settings.ads.."\n○*》ℓσ¢к єηgℓιѕн :* "..settings.english.."\n●*》ℓσ¢к αяαвι¢ :* "..settings.lock_arabic.."\n○*》ℓσ¢к мαяк∂σωη :* "..settings.lock_markdown.."\n●*》ℓσ¢к ̶ριη мєѕѕαgє:* "..settings.lock_pin.."\n○*》ℓσ¢к ̶νιєωѕ мєѕѕαgє :* "..settings.views.."\n*_______________*\n`🔇 GroUp MuTe List :`\n●*》мυтє тιмєαℓℓ :* "..mute_all1.."\n○*》мυтє ̶gιƒ :* "..settings.mute_gif.."\n●*》мυтє ̶тєχт:* "..settings.mute_text.."\n○*》мυтє  ιηℓιηє:* "..settings.mute_inline.."\n●*》мυтє gαмє :* "..settings.mute_game.."\n○*》мυтє ̶ρнσтσ:* "..settings.mute_photo.."\n●*》мυтє νι∂єσ:* "..settings.mute_video.."\n○*》мυтє αυ∂ισ :* "..settings.mute_audio.."\n●*》мυтє νσι¢є :* "..settings.mute_voice.."\n○*》мυтє  ̶ѕтι¢кєя:* "..settings.mute_sticker.."\n●*》мυтє ¢σηтα¢т :* "..settings.mute_contact.."\n○*》мυтє ̶ƒσяωαя∂ :* "..settings.mute_forward.."\n●*》мυтє  ̶ℓσ¢αтιση:* "..settings.mute_location.."\n○*》мυтє ∂σ¢υмєηт:* "..settings.mute_document.."\n●*》мυтє тgѕєяνι¢є :* "..settings.mute_tgservice.."\n○*》мυтє ̶кєувσαя∂ :* "..settings.mute_keyboard.."\n*_______________*\n`💠 OThEr SettinGs :`\n●*》gяσυρ ωєℓ¢σмє :* "..settings.welcome.."\n○*》вσтѕ ρяσтє¢тιση :* "..settings.lock_bots.."\n●*》ƒℓσρ∂ ѕєηѕιтινιту:* `"..NUM_MSG_MAX.."`\n○*》ƒℓσσ∂ ¢є¢к тιмє:* `"..TIME_CHECK.."`\n●*》¢нαяα¢тєя ѕєηѕιтινιту :* `"..SETCHAR.."`\n○*》вσтѕ ¢σммαη∂ѕ:* "..cmdsss.."\n●*》єχριяє ∂αтє :* `"..expire_date.."`\n*_______________*\n`🌐 InfoRmaTion :`\n⚜*》gяσυρ ηαмє :* "..msg.to.title.."\n⚜*》gяσυρ ι∂ :* `"..msg.to.id.."`\n⚜*》уσυя ηαмє :* "..(check_markdown(msg.from.first_name) or 'No ɳαɱҽ').."\n⚜*》уσυя ι∂ :* `"..msg.from.id.."`\n⚜*》υѕєяηαмє :* @"..check_markdown(msg.from.username or "sudoX").."\n*_______________*\n*📋 ƇнαηηєƖ :* @luxurybots\n*💻 ρσωєяɗ Ɓу :* @sudoX\n*🔠 Ɠяσυρ Lαηgυαgє :* `Eɠ`"
else
local exp = redis:get("charged:"..msg.chat_id_)
    local day = 86400
    local ex = redis:ttl("charged:"..msg.chat_id_)
       if not exp or ex == -1 then
        expirefa = "نــامحــدود"
       else
        local d = math.floor(ex / day ) + 1
       expirefa = " *"..d.."* _روز_"
   end
local settings = data[tostring(target)]["settings"] 
 text ="*gяσυρ ѕєттιηgѕ яα∂ιкαℓвσт :*\n*_______________*\n`🔐 لیـــست قفلــی گروه :`\n●*》قفـل ویرایش :* "..settings.lock_edit.."\n○*》قفـل لینڪ :* "..settings.lock_link.."\n●*》قفـل یوزرنیم :* "..settings.lock_username.."\n○*》 قفـل هشتگ :* "..settings.lock_hashtags.."\n●*》قفـل شڪلڪ :* "..settings.emoji.."\n○*》قفـل ورود :* "..settings.lock_join.."\n●*》قفـل تبچی :* "..settings.lock_tabchi.."\n○*》قفـل اسپم :* "..settings.lock_spam.."\n●*》قفـل فلود :* "..settings.flood.."\n○*》قفـل فحش :* "..settings.fosh.."\n●*》قفـل فراخوانی  :* "..settings.lock_mention.."\n○*》قفـل وب :* "..settings.lock_webpage.."\n●*》قفـل تبلیغات  :* "..settings.ads.."\n○*》قفـل انگلیسی :* "..settings.english.."\n●*》قفـل عربی :* "..settings.lock_arabic.."\n○*》قفـل فونت :* "..settings.lock_markdown.."\n●*》فـل سنجاق :* "..settings.lock_pin.."\n○*》قفـل بنر :* "..settings.views.."\n*_______________*\n`🔇 لیـــست ّبیصــدا گروه :`\n●*》بیصدا زمان دار :* "..mute_all2.."\n○*》بیصدا گیف :* "..settings.mute_gif.."\n●*》بیصدا متن :* "..settings.mute_text.."\n○*》بیصدا اینلاین :* "..settings.mute_inline.."\n●*》بیصدا بازی:* "..settings.mute_game.."\n○*》بیصدا عکس :* "..settings.mute_photo.."\n●*》بیصدا فیلم :* "..settings.mute_video.."\n○*》بیصدا اهنگ :* "..settings.mute_audio.."\n●*》بیصدا ویس:* "..settings.mute_voice.."\n○*》بیصدا استیکر :* "..settings.mute_sticker.."\n●*》بیصدا ارسال مخاطب :* "..settings.mute_contact.."\n○*》بیصدا نقل و قول :* "..settings.mute_forward.."\n●*》بیصدا مکان :* "..settings.mute_location.."\n○*》بیصدا فایل :* "..settings.mute_document.."\n●*》بیصدا ورود و خروج :* "..settings.mute_tgservice.."\n○*》بیصدا کیبورد :* "..settings.mute_keyboard.."\n*_______________*\n`💠 لیســـت تنظیمات دیگر :`\n●*》وضعیت ولکام :* "..settings.welcome.."\n○*》محافظت گروه در برابر ربات :* "..settings.lock_bots.."\n●*》حداکثر پیام مکرر:* `"..NUM_MSG_MAX.."`\n○*》زمان برسی پیام مکرر:* `"..TIME_CHECK.."`\n●*》حداکثر کارکتر مجاز :* `"..SETCHAR.."`\n○*》دستورات ربات :* "..cmdsss.."\n●*》تـاریخ انقضـا :* `"..expire_date.."`\n*_______________*\n`🌐 اطلـاعاتــ :`\n⚜*》نـام گـروه :* "..msg.to.title.."\n⚜*》ایـدی گـروه :* `"..msg.to.id.."`\n⚜*》نـام شمـا :* "..(check_markdown(msg.from.first_name) or 'No ɳαɱҽ').."\n⚜*》ایـدی شمـا :* `"..msg.from.id.."`\n⚜*》شنـاسه شمـا :* @"..(check_markdown(msg.from.username or 'No υʂҽɾɳαɱҽ')).."\n*_______________*\n*کــانال :* @luxurybots\n*برنامه نویــس :* @sudoX\n*زبان گــروه :* `فارسی`"
end
if not lang then
text = string.gsub(text, "yes", "`🔐`")
text = string.gsub(text, "no", "`🔓`")
 else
 text = string.gsub(text, "yes", "#فعال ")
 text =  string.gsub(text, "no", "#غیرفعال")
 end

return text
end

local function run(msg, matches)
if is_banned(msg.from.id, msg.to.id) or is_gbanned(msg.from.id, msg.to.id) or is_silent_user(msg.from.id, msg.to.id) then
return false
end
local cmd = redis:hget('group:'..msg.to.id..':cmd', 'bot')
local mutealll = redis:get('group:'..msg.to.id..':muteall')
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
if cmd == 'moderator' and not is_mod(msg) or cmd == 'owner' and not is_owner(msg) or mutealll and not is_mod(msg) then
 return 
 else
if msg.to.type ~= 'pv' then
if matches[1] == "id" or matches[1]=="آیدی" or matches[1]=="Id" or matches[1]=="ایدی"then
if not matches[2] and not msg.reply_id then
local function getpro(arg, data)
 if data.photos_[0] then
       if not lang then
            tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"Group Name : "..(check_markdown(msg.to.title)).."\nGroup ID : "..msg.to.id.."\nName : "..(check_markdown(msg.from.first_name or "----")).."\nUserName : @"..(msg.from.username or "").."\nUser ID : "..msg.from.id.."",dl_cb,nil)
       elseif lang then
          tdcli.sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, data.photos_[0].sizes_[1].photo_.persistent_id_,"نام گروه : "..(check_markdown(msg.to.title)).."\nشناسه گروه : "..msg.to.id.."\nنام شما : "..(check_markdown(msg.from.first_name or "----")).."\nنام کاربری : @"..(msg.from.username or "").."\nشناسه شما : "..msg.from.id.."",dl_cb,nil)
     end
   else
       if not lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "`You Have Not Profile Photo...!`\n\n> *Chat ID :* `"..msg.to.id.."`\n*User ID :* `"..msg.from.id.."`", 1, 'md')
       elseif lang then
      tdcli.sendMessage(msg.to.id, msg.id_, 1, "_شما هیچ عکسی ندارید...!_\n\n> _شناسه گروه :_ `"..msg.to.id.."`\n_شناسه شما :_ `"..msg.from.id.."`", 1, 'md')
            end
        end
end
	   tdcli_function ({
    ID = "GetUserProfilePhotos",
    user_id_ = msg.from.id,
    offset_ = 0,
    limit_ = 1
  }, getpro, nil)	
end
if msg.reply_id and not matches[2] then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
if matches[1] == "pin" and is_mod(msg) and msg.reply_id  or matches[1] == "سنجاق" and is_mod(msg) and msg.reply_id or matches[1] == "Pin" and is_mod(msg) and msg.reply_id then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Mєѕѕαgє Hαѕ Bєєη Pιηηє∂*"
elseif lang then
return "_پیام سجاق شد_✅"
end
elseif not is_owner(msg) then
   return
 end
 elseif lock_pin == 'no' then
    data[tostring(chat)]['pin'] = msg.reply_id
	  save_data(_config.moderation.data, data)
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1)
if not lang then
return "*Mєѕѕαgє Hαѕ Bєєη Pιηηє∂*"
elseif lang then
return "_پیام سجاق شد_✅"
end
end
end
if matches[1] == 'unpin' and is_mod(msg) or matches[1] == 'برداشتن سنجاق' and is_mod(msg) or matches[1] == 'Unpin' and is_mod(msg) then
local lock_pin = data[tostring(msg.to.id)]["settings"]["lock_pin"] 
 if lock_pin == 'yes' then
if is_owner(msg) then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pιη мєѕѕαgє нαѕ вєєη υηριηηє∂*"
elseif lang then
return "پیام سنجاق شده پاک شد✅"
end
elseif not is_owner(msg) then
   return 
 end
 elseif lock_pin == 'no' then
tdcli.unpinChannelMessage(msg.to.id)
if not lang then
return "*Pιη мєѕѕαgє нαѕ вєєη υηριηηє∂*"
elseif lang then
return "پیام سنجاق شده پاک شد✅"
end
end
end
if matches[1] == "add" or  matches[1] == "نصب" or matches[1] == "Add" then
return modadd(msg)
end
if matches[1] == "rem" or matches[1] == "لغو نصب" or matches[1] == "Rem" then
return modrem(msg)
end
if (matches[1]:lower() == "setmanager" or matches[1] == 'Setmanager' or matches[1] == 'ادمین گروه') and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setmanager"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setmanager"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setmanager"})
      end
   end
if (matches[1]:lower() == "remmanager" or matches[1] == 'Remmanager' or matches[1] == 'حذف ادمین گروه') and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remmanager"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remmanager"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remmanager"})
      end
   end
if (matches[1]:lower() == "whitelist" or matches[1]:lower() == "Whitelist" or matches[1] == 'لیست سفید') and matches[2] == "+" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="setwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="setwhitelist"})
      end
   end
if (matches[1]:lower() == "whitelist" or matches[1] == 'لیست سفید') and matches[2] == "-" and is_mod(msg) then
if not matches[3] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remwhitelist"})
  end
  if matches[3] and string.match(matches[3], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[3],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[3],cmd="remwhitelist"})
    end
  if matches[3] and not string.match(matches[3], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[3]
    }, action_by_username, {chat_id=msg.to.id,username=matches[3],cmd="remwhitelist"})
      end
   end
if matches[1] == "setowner" and is_admin(msg) or  matches[1] == "تنظیم مالک" and is_admin(msg) or matches[1] == "Setowner" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="setowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="setowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="setowner"})
      end
   end
if matches[1] == "remowner" and is_admin(msg) or matches[1] == "حذف مالک" and is_admin(msg) or matches[1] == "Remowner" and is_admin(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="remowner"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="remowner"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="remowner"})
      end
   end
if matches[1] == "promote" and is_owner(msg) or matches[1] == "ترفیع" and is_owner(msg) or matches[1] == "Promote" and is_owner(msg) then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="promote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="promote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="promote"})
      end
   end
if matches[1] == "demote" and is_owner(msg) or  matches[1] == "تنزل" and is_owner(msg) or matches[1] == "Demote" and is_owner(msg) then
if not matches[2] and msg.reply_id then
 tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="demote"})
  end
  if matches[2] and string.match(matches[2], '^%d+$') then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="demote"})
    end
  if matches[2] and not string.match(matches[2], '^%d+$') then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="demote"})
      end
   end
   
    if matches[1] == 'del' and is_mod(msg) or matches[1] == 'Del' and is_mod(msg) or matches[1] == 'rmsg' and is_mod(msg) or matches[1] == 'Rmsg' and is_mod(msg) or matches[1] == 'حذف' and is_mod(msg) then
        if tostring(msg.to.id):match("^-100") then 
            if tonumber(matches[2]) > 1000 or tonumber(matches[2]) < 1 then
                return  '🚫 *1000*> _تعداد پیام های قابل پاک سازی در هر دفعه_ >*1* 🚫'
            else
				tdcli.getChatHistory(msg.to.id, msg.id,0 , 100, delmsg, {msgs=matches[2]})
				return "`"..matches[2].." `_پیام اخیر با موفقیت پاکسازی شدند_ 🚮"
            end
        else
            return '⚠️ _این قابلیت فقط در سوپرگروه ممکن است_ ⚠️'
        end
    end
   
if matches[1] == "lock" and is_mod(msg) or  matches[1] == "قفل" and is_mod(msg) or matches[1] == "Lock" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link" or matches[2]=="لینک" then
return lock_link(msg, data, target)
end
if matches[2] == "username"  or matches[2]=="یوزرنیم" then
return lock_username(msg, data, target)
end
if matches[2] == "hashtag"  or matches[2]=="هشتگ" then
return lock_hashtags(msg, data, target)
end
if matches[2] == "mention"  or matches[2]=="فراخوانی" then
return lock_mention(msg, data, target)
end
if matches[2] == "arabic"  or matches[2]=="عربی" then
return lock_arabic(msg, data, target)
end
if matches[2] == "edit"  or matches[2]=="ویرایش" then
return lock_edit(msg, data, target)
end
if matches[2] == "spam"  or matches[2]=="اسپم" then
return lock_spam(msg, data, target)
end
if matches[2] == "flood"  or matches[2]=="حساسیت" then
return lock_flood(msg, data, target)
end
if matches[2] == "bots"  or matches[2]=="ربات" then
return lock_bots(msg, data, target)
end
if matches[2] == "markdown" or matches[2]=="مارکدون" then
return lock_markdown(msg, data, target)
end
if matches[2] == "webpage"  or matches[2]=="وب" then
return lock_webpage(msg, data, target)
end
if matches[2] == "pin" and is_owner(msg)  or matches[2]=="سنجاق" and is_owner(msg) then
return lock_pin(msg, data, target)
end
if matches[2] == "english"  or matches[2]=="انگلیسی"  then
return lock_english(msg, data, target)
end
if matches[2] == "views"  or matches[2]=="ویو" then
return lock_views(msg, data, target)
end
if matches[2] == "emoji"  or matches[2]=="امجو" then
return lock_emoji(msg, data, target)
end
if matches[2] == "fosh"  or matches[2]=="فحش" then
return lock_fosh(msg, data, target)
end
if matches[2] == "ads"  or matches[2]=="تبلیغات" then
return lock_ads(msg, data, target)
end
if matches[2] == "tabchi"  or matches[2] == "تبچی" then
return lock_tabchi(msg, data, target)
end
if matches[2] == "join" or matches[2] == "ورود" then
return lock_join(msg, data, target)
end
if matches[2] == 'cmds' or matches[2] == "دستورات" then
			redis:hset('group:'..msg.to.id..':cmd', 'bot', 'moderator')
			if not lang then
			return "*#¢мđš* _ρøšт łš αlяeαđч lø¢κeđ_🔒\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
			elseif lang then
			return "قفل دستوارت برای کاربران در گروه ممنوع شد🔒\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
			end
			end
end

if matches[1] == "unlock" and is_mod(msg) or matches[1]=="بازکردن" and is_mod(msg) or matches[1] == "Unlock" and is_mod(msg) then
local target = msg.to.id
if matches[2] == "link"  or matches[2]=="لینک" then
return unlock_link(msg, data, target)
end
if matches[2] == "username"  or matches[2]=="یوزرنیم" then
return unlock_username(msg, data, target)
end
if matches[2] == "hashtag"  or matches[2]=="هشتگ" then
return unlock_hashtags(msg, data, target)
end				
if matches[2] == "mention"  or matches[2]=="فراخوانی" then
return unlock_mention(msg, data, target)
end
if matches[2] == "arabic"  or matches[2]=="عربی" then
return unlock_arabic(msg, data, target)
end
if matches[2] == "edit"  or matches[2]=="ویرایش" then
return unlock_edit(msg, data, target)
end
if matches[2] == "spam"  or matches[2]=="اسپم" then
return unlock_spam(msg, data, target)
end
if matches[2] == "flood" or matches[2]=="حساسیت" then
return unlock_flood(msg, data, target)
end
if matches[2] == "bots"  or matches[2]=="ربات" then
return unlock_bots(msg, data, target)
end
if matches[2] == "markdown"  or matches[2]=="مارکدون" then
return unlock_markdown(msg, data, target)
end
if matches[2] == "webpage" or matches[2]=="وب" then
return unlock_webpage(msg, data, target)
end
if matches[2] == "pin" and is_owner(msg)  or matches[2]=="سنجاق" and is_owner(msg)  then
return unlock_pin(msg, data, target)
end
if matches[2] == "english" or matches[2]=="انگلیسی"  then
return unlock_english(msg, data, target)
end
if matches[2] == "views" or matches[2]=="ویو" then
return unlock_views(msg, data, target)
end
if matches[2] == "emoji" or matches[2]=="امجو" then
return unlock_emoji(msg, data, target)
end
if matches[2] == "fosh"  or matches[2]=="فحش" then
return unlock_fosh(msg, data, target)
end
if matches[2] == "ads"  or matches[2]=="تبلیغات" then
return unlock_ads(msg, data, target)
end
if matches[2] == "tabchi" or matches[2] == "تبچی" then
return unlock_tabchi(msg, data, target)
end
if matches[2] == "join" or matches[2] == "ورود" then
return unlock_join(msg, data, target)
end
if matches[2] == 'cmds' or matches[2] == 'دستورات' then
			redis:del('group:'..msg.to.id..':cmd')
			if not lang then
			return "*#¢мđš* _ρøšтłиg łš иøт lø¢κeđ_🔓\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
			elseif lang then
			return "قفل #دستوارت برای کاربران در گروه آزاد شد 🔓\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
			end
			end
end

if matches[1] == "mute" and is_mod(msg) or matches[1]== "بیصدا" and is_mod(msg) or matches[1] == "Mute" and is_mod(msg) then
local target = msg.to.id
if matches[2] == 'all' or matches[2] == 'همه' then
local hash = 'muteall:'..msg.to.id
redis:set(hash, true)
if not lang then
return "*#мυтe αll* _ħαš вeeи eиαвleđ_🔇\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
elseif lang then
return "بیصدا کردن #همه فعال شد🔇\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
if matches[2] == "gif"  or matches[2]=="گیف" then
return mute_gif(msg, data, target)
end
if matches[2] == "text"  or matches[2]=="متن" then
return mute_text(msg ,data, target)
end
if matches[2] == "photo"  or matches[2]=="عکس" then
return mute_photo(msg ,data, target)
end
if matches[2] == "video"  or matches[2]=="ویدیو" then
return mute_video(msg ,data, target)
end
if matches[2] == "audio"  or matches[2]=="اهنگ" then
return mute_audio(msg ,data, target)
end
if matches[2] == "voice"  or matches[2]=="ویس" then
return mute_voice(msg ,data, target)
end
if matches[2] == "sticker"  or matches[2]=="استیکر" then
return mute_sticker(msg ,data, target)
end
if matches[2] == "contact"  or matches[2]=="مخاطب" then
return mute_contact(msg ,data, target)
end
if matches[2] == "forward"  or matches[2]=="فوروارد" then
return mute_forward(msg ,data, target)
end
if matches[2] == "location"  or matches[2]=="مکان" then
return mute_location(msg ,data, target)
end
if matches[2] == "document"  or matches[2]=="فایل" then
return mute_document(msg ,data, target)
end
if matches[2] == "tgservice"  or matches[2]=="سرویس تلگرام" then
return mute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2]=="دکمه شیشه ای" then
return mute_inline(msg ,data, target)
end
if matches[2] == "game"  or matches[2]=="بازی" then
return mute_game(msg ,data, target)
end
if matches[2] == "keyboard"  or matches[2]=="کیبورد" then
return mute_keyboard(msg ,data, target)
end
end

if matches[1] == "unmute" and is_mod(msg) or matches[1]=="باصدا" and is_mod(msg) or matches[1] == "Unmute" and is_mod(msg) then
local target = msg.to.id
 if matches[2] == 'all' or matches[2] == 'همه' then
         local hash = 'muteall:'..msg.to.id
        redis:del(hash)
		if not lang then
        return "*#мυтe αll* _ħαš вeeи đłšαвleđ_🔊\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
		elseif lang then
		return "بیصدا کردن #همه غیر فعال شد🔊\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
end
end
if matches[2] == "gif"  or matches[2]=="گیف"then
return unmute_gif(msg, data, target)
end
if matches[2] == "text" or matches[2]=="متن" then
return unmute_text(msg, data, target)
end
if matches[2] == "photo" or matches[2]=="عکس" then
return unmute_photo(msg ,data, target)
end
if matches[2] == "video" or matches[2]=="ویدیو" then
return unmute_video(msg ,data, target)
end
if matches[2] == "audio" or matches[2]=="اهنگ" then
return unmute_audio(msg ,data, target)
end
if matches[2] == "voice" or matches[2]=="ویس" then
return unmute_voice(msg ,data, target)
end
if matches[2] == "sticker" or matches[2]=="استیکر" then
return unmute_sticker(msg ,data, target)
end
if matches[2] == "contact" or matches[2]=="مخاطب" then
return unmute_contact(msg ,data, target)
end
if matches[2] == "forward" or matches[2]=="فوروارد" then
return unmute_forward(msg ,data, target)
end
if matches[2] == "location"  or matches[2]=="مکان" then
return unmute_location(msg ,data, target)
end
if matches[2] == "document"  or matches[2]=="فایل" then
return unmute_document(msg ,data, target)
end
if matches[2] == "tgservice" or matches[2]=="سرویس تلگرام" then
return unmute_tgservice(msg ,data, target)
end
if matches[2] == "inline" or matches[2]=="دکمه شیشه ای" then
return unmute_inline(msg ,data, target)
end
if matches[2] == "game"  or matches[2]=="بازی" then
return unmute_game(msg ,data, target)
end
if matches[2] == "keyboard"   or matches[2]=="کیبورد" then
return unmute_keyboard(msg ,data, target)
end
end
if matches[1]:lower() == 'cmds' and is_owner(msg) or matches[1] == 'دستورات' and is_owner(msg) then 
		if matches[2]:lower() == 'owner' or matches[2] == 'مالک' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'owner') 
		if not lang then
		return "¢мđš šeт føя øωиeя øя ħłgħeя\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
		elseif lang then
		return "دستورات برای مدیرکل به بالا دیگر جواب می دهد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]" 
		end
		end
		if matches[2]:lower() == 'mod' or matches[2] == 'مدیر' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'moderator')
		if not lang then
		return "¢мđš šeт føя мøđeяαтøя øя ħłgħeя\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
		elseif lang then
		return "دستورات برای مدیر به بالا دیگر جواب می دهد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
		end 
		end
		if matches[2]:lower() == 'member' or matches[2] == 'کاربر' then 
		redis:hset('group:'..msg.to.id..':cmd', 'bot', 'member') 
		if not lang then
		return "¢мđš šeт føя мeмвeя øя ħłgħeя\n*〰〰〰〰〰〰〰〰*\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]"
		elseif lang then
		return "دستورات برای کاربر عادی به بالا دیگر جواب می دهد\n*〰〰〰〰〰〰〰〰*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]"
		end 
		end
		end
if matches[1] == "gpinfo" and is_mod(msg) and msg.to.type == "channel" or matches[1] == "اطلاعات گروه" and is_mod(msg) and msg.to.type == "channel" or matches[1] == "Gpinfo" and is_mod(msg) and msg.to.type == "channel" then
local function group_info(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
if not lang then
ginfo = "*gяøυρ Iηƒσ :*\n👤_αđмłи ¢øυит :_ *"..data.administrator_count_.."*\n👥_Mємвєя ¢øυит :_ *"..data.member_count_.."*\n_κł¢κeđ ¢øυит :_ *"..data.kicked_count_.."*\n_gяøυρ ID :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
elseif lang then
ginfo = "*اطلاعات گروه :*\n_تعداد مدیران :_ *"..data.administrator_count_.."*\n_تعداد اعضا :_ *"..data.member_count_.."*\n_تعداد اعضای حذف شده :_ *"..data.kicked_count_.."*\n_شناسه گروه :_ *"..data.channel_.id_.."*"
print(serpent.block(data))
end
        tdcli.sendMessage(arg.chat_id, arg.msg_id, 1, ginfo, 1, 'md')
end
 tdcli.getChannelFull(msg.to.id, group_info, {chat_id=msg.to.id,msg_id=msg.id})
end
if matches[1] == 'newlink' and is_mod(msg) or  matches[1] == 'لینک جدید' and is_mod(msg) then
			local function callback_link (arg, data)
   local hash = "gp_lang:"..msg.to.id
   local lang = redis:get(hash)
    local administration = load_data(_config.moderation.data) 
				if not data.invite_link_ then
					administration[tostring(msg.to.id)]['settings']['linkgp'] = nil
					save_data(_config.moderation.data, administration)
       if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_Bσт ιѕ ησт gяσυρ cяєαтσя_\n_ѕєт α ℓιηк  σя ƒσя gяσυρ ωιтн υѕιηg_ /setlink or تنظیم لینک", 1, 'md')
       elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_ربات سازنده گروه نیست_\n_با دستور_ setlink/  _یا تنظیم لینک لینک جدیدی برای گروه ثبت کنید_", 1, 'md')
    end
				else
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
        if not lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "*Nєωℓιηк Cяєαтє∂*", 1, 'md')
        elseif lang then
       return tdcli.sendMessage(msg.to.id, msg.id, 1, "_لینک جدید ساخته شد_", 1, 'md')
     end
					administration[tostring(msg.to.id)]['settings']['linkgp'] = data.invite_link_
					save_data(_config.moderation.data, administration)
				end
			end
 tdcli.exportChatInviteLink(msg.to.id, callback_link, nil)
		end
		if matches[1] == 'setlink' and is_owner(msg) or matches[1] == 'تنظیم لینک' and is_owner(msg) or matches[1] == 'Setlink' and is_owner(msg) then
			data[tostring(chat)]['settings']['linkgp'] = 'waiting'
			save_data(_config.moderation.data, data)
      if not lang then
			return '_Please send the new group_ *link* _now_'
    else 
         return 'لطفا لینک گروه خود را ارسال کنید'
       end
		end

		if msg.text then
   local is_link = msg.text:match("^([https?://w]*.?telegram.me/joinchat/%S+)$") or msg.text:match("^([https?://w]*.?t.me/joinchat/%S+)$")
			if is_link and data[tostring(chat)]['settings']['linkgp'] == 'waiting' and is_owner(msg) then
				data[tostring(chat)]['settings']['linkgp'] = msg.text
				save_data(_config.moderation.data, data)
            if not lang then
				return "*Newlink* _has been set_"
           else
           return "لینک جدید ذخیره شد"
		 	end
       end
		end
    if matches[1] == 'link' and (msg) or  matches[1] == 'لینک' and (msg) or matches[1] == 'Link' and (msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
       if not lang then
        return "_fłяšт ¢яeαтe α lłиκ føя gяøυρ ωłтħ υšłиg_ /newlink or {لینک جدید} \n_łf вøт иøт gяøυρ ¢яeαтøя šeт α lłиκ ωłтħ υšłиg_ /setlink or {تنظیم لینک}"
     else
        return "ابتدا با دستور newlink/ یا {لینک جدید} لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ یا {تنظیم لینک} لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
       text = "<b>Gяσυρ Lιηк :</b>\n"..linkgp
     else
      text = "<b>لینک گروه :</b>\n"..linkgp
         end
        return tdcli.sendMessage(chat, msg.id, 1, text, 1, 'html')
     end
if matches[1] == 'linkpv' and is_mod(msg) or matches[1] == 'Linkpv' and is_mod(msg) or matches[1] == 'لینک پیوی' and is_mod(msg) then
      local linkgp = data[tostring(chat)]['settings']['linkgp']
      if not linkgp then
      if not lang then
        return "_fłяšт ¢яeαтe α lłиκ føя gяøυρ ωłтħ υšłиg_ /newlink\n_łf вøт иøт gяøυρ ¢яeαтøя šeт α lłиκ ωłтħ υšłиg_ /setlink"
     else
        return "ابتدا با دستور newlink/ لینک جدیدی برای گروه بسازید\nو اگر ربات سازنده گروه نیس با دستور setlink/ لینک جدیدی برای گروه ثبت کنید"
      end
      end
     if not lang then
     tdcli.sendMessage(user, "", 1, "<b>Group Link "..msg.to.title.." :</b>\n"..linkgp, 1, 'html')
     else
      tdcli.sendMessage(user, "", 1, "<b>لینک گروه "..msg.to.title.." :</b>\n"..linkgp, 1, 'html')
         end
      if not lang then
        return "*Group Link Was Send In Your Private Message*"
       else
        return "_لینک گروه به چت خصوصی شما ارسال شد_"
        end
     end
  if matches[1] == "setrules" and matches[2] and is_mod(msg) or matches[1] == "تنظیم قوانین" and matches[2] and is_mod(msg) or matches[1] == "Setrules" and matches[2] and is_mod(msg) then
    data[tostring(chat)]['rules'] = matches[2]
	  save_data(_config.moderation.data, data)
     if not lang then
    return "*Group rules* _has been set_"
   else 
  return "قوانین گروه ثبت شد"
   end
  end
  if matches[1] == "rules" or matches[1] == "قوانین" or matches[1] == "Rules" then
 if not data[tostring(chat)]['rules'] then
   if not lang then
     rules = "@luxurybots"
    elseif lang then
       rules = "@luxurybots"
 end
        else
     rules = "*Group Rules :*\n"..data[tostring(chat)]['rules']
      end
    return rules
  end
if matches[1] == "res" and matches[2] and is_mod(msg) or matches[1] == "Res" and matches[2] and is_mod(msg) or matches[1] == "رس" and matches[2] and is_mod(msg) then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="res"})
  end
if matches[1] == "whois" and matches[2] and is_mod(msg) or matches[1] == "Whois" and matches[2] and is_mod(msg) or matches[1] == "شخص" and matches[2] and is_mod(msg) then
tdcli_function ({
    ID = "GetUser",
    user_id_ = matches[2],
  }, action_by_id, {chat_id=msg.to.id,user_id=matches[2],cmd="whois"})
  end
if matches[1]:lower() == 'setchar' and is_mod(msg) or matches[1]:lower() == 'Setchar'  and is_mod(msg) or matches[1]:lower() == 'حداکثر حروف مجاز' and is_mod(msg) then
			if not is_mod(msg) then
				return
			end
			local chars_max = matches[2]
			data[tostring(msg.to.id)]['settings']['set_char'] = chars_max
			save_data(_config.moderation.data, data)
    if not lang then
     return "*Character sensitivity* _has been set to :_ *[ "..matches[2].." ]*"
   else
     return "_حداکثر حروف مجاز در پیام تنظیم شد به :_ *[ "..matches[2].." ]*"
		end
  end
  if matches[1] == 'setflood' and is_mod(msg) or matches[1] == 'حساسیت اسپم' and is_mod(msg) or matches[1] == 'Setflood' and is_mod(msg) then
			if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 200 then
				return "_Wrong number, range is_ *[1-50]*"
      end
			local flood_max = matches[2]
			data[tostring(chat)]['settings']['num_msg_max'] = flood_max
			save_data(_config.moderation.data, data)
    return "_Group_ *flood* _sensitivity has been set to :_ *[ "..matches[2].." ]*"
       end
  if matches[1]:lower() == 'setfloodtime' and is_mod(msg) or matches[1]:lower() == 'Setfloodtime' and is_mod(msg) or matches[1] == 'تنظیم زمان بررسی' and is_mod(msg) then
			if tonumber(matches[2]) < 2 or tonumber(matches[2]) > 10 then
				return "_Wrong number, range is_ *[2-10]*"
      end
			local time_max = matches[2]
			data[tostring(chat)]['settings']['time_check'] = time_max
			save_data(_config.moderation.data, data)
			if not lang then
    return "_Group_ *flood* _check time has been set to :_ *[ "..matches[2].." ]*"
    else
    return "_حداکثر زمان بررسی پیام های مکرر تنظیم شد به :_ *[ "..matches[2].." ]*"
    end
       end
		if matches[1]:lower() == 'clean' and is_owner(msg) or matches[1]:lower() == 'پاک کردن' and is_owner(msg) or matches[1]:lower() == 'Clean' and is_owner(msg) then
			if matches[2] == 'mods' or  matches[2] == 'مدیران' then
				if next(data[tostring(chat)]['mods']) == nil then
            if not lang then
          return "_иø_ *мøđeяαтøяѕ* _łи тħłš gяøυρ_"
             else
                return "هیچ مدیری برای ربات در این گروه انتخاب نشده است"
				end
            end
				for k,v in pairs(data[tostring(chat)]['mods']) do
					data[tostring(chat)]['mods'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
        return "_αll_ *мøđeяαтøяѕ* _ħαš вeeи đeмøтeđ_"
          else
            return "تمام مدیران ربات در گروه تنزیل مقام شدند"
			end
         end
			if matches[2] == 'filterlist' or matches[2] == 'لیست فیلتر' or matches[2] == 'Filterlist' then
				if next(data[tostring(chat)]['filterlist']) == nil then
     if not lang then
          return "*fłlтeяeđ ωøяđ lłšт* _łš eмρтч_"
         else
          return "_لیست کلمات فیلتر شده خالی است_"
             end
				end
				for k,v in pairs(data[tostring(chat)]['filterlist']) do
					data[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
       if not lang then
        return "*fłlтeяeđ ωøяđ lłšт* _ħαš вeeи ¢leαиeđ_"
           else
        return "_لیست کلمات فیلتر شده پاک شد_"
           end
			end
			if matches[2] == 'rules' or matches[2] == 'قوانین' or matches[2] == 'Rules' then
				if not data[tostring(chat)]['rules'] then
            if not lang then
          return "_иø_ *яυleš* _αναłlαвle_"
             else
               return "قوانین برای گروه ثبت نشده است"
             end
				end
					data[tostring(chat)]['rules'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
        return "*gяøυρ яυleš* _ħαš вeeи ¢leαиeđ_"
          else
            return "قوانین گروه پاک شد"
			end
       end
			if matches[2] == 'welcome' or  matches[2] == 'ولکام' or matches[2] == 'Welcome' then
				if not data[tostring(chat)]['setwelcome'] then
            if not lang then
					        return "ωel¢øмe мeššαge иøт šeт"
             else
               return "پیام خوشآمد گویی ثبت نشده است"
             end
				end
					data[tostring(chat)]['setwelcome'] = nil
					save_data(_config.moderation.data, data)
             if not lang then
        return "*ωel¢øмe мeššαge* _ħαš вeen ¢leαиeđ_"
          else
            return "پیام خوشآمد گویی پاک شد"
			end
       end
			if matches[2] == 'about'  or matches[2] == 'درباره گروه' or matches[2] == 'About' then
        if msg.to.type == "chat" then
				if not data[tostring(chat)]['about'] then
            if not lang then
          return "_иø_ *đeš¢яłρтłøи* _αναłlαвle_"
            else
              return "پیامی مبنی بر درباره گروه ثبت نشده است"
          end
				end
					data[tostring(chat)]['about'] = nil
					save_data(_config.moderation.data, data)
        elseif msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, "", dl_cb, nil)
             end
             if not lang then
        return "*gяøυρ đeš¢яłρтłøи* _нαѕ вєєη cℓєαηє∂_"
           else
              return "پیام مبنی بر درباره گروه پاک شد"
             end
		   	end
        end
		if matches[1]:lower() == 'clean' and is_admin(msg) or matches[1]:lower() == 'پاک کردن' and is_admin(msg) or matches[1]:lower() == 'Clean' and is_admin(msg) then
			if matches[2] == 'owners' or matches[2] == 'مالک' then
				if next(data[tostring(chat)]['owners']) == nil then
             if not lang then
          return "_иø_ *øωиeяš* _łи тħłš gяøυρ_"
            else
                return "مالکی برای گروه انتخاب نشده است"
            end
				end
				for k,v in pairs(data[tostring(chat)]['owners']) do
					data[tostring(chat)]['owners'][tostring(k)] = nil
					save_data(_config.moderation.data, data)
				end
            if not lang then
		     return "_αll_ *øωиeяš* _ħαš вeeи đeмøтeđ_"
           else
            return "تمامی مالکان گروه تنزیل مقام شدند"
          end
			end
     end
if matches[1] == "setname" and matches[2] and is_mod(msg) or matches[1] == "تنظیم نام" and matches[2] and is_mod(msg) or matches[1] == "Setname" and matches[2] and is_mod(msg) then
local gp_name = matches[2]
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
  if matches[1] == "setabout" and matches[2] and is_mod(msg) or  matches[1] == "تنظیم درباره گروه" and matches[2] and is_mod(msg) or matches[1] == "Setabout" and matches[2] and is_mod(msg) then
     if msg.to.type == "channel" then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    elseif msg.to.type == "chat" then
    data[tostring(chat)]['about'] = matches[2]
	  save_data(_config.moderation.data, data)
     end
     if not lang then
    return "*gяøυρ đeš¢яłρтłøи* _ħαš вeeи šeт_"
    else
     return "پیام مبنی بر درباره گروه ثبت شد"
      end
  end
  if matches[1] == "about" and msg.to.type == "chat" or matches[1] == "درباره گروه" and msg.to.type == "chat" or matches[1] == "About" and msg.to.type == "chat" then
 if not data[tostring(chat)]['about'] then
     if not lang then
     about = "_иø_ *đeš¢яłρтłøи* _αναłlαвle_"
      elseif lang then
      about = "پیامی مبنی بر درباره گروه ثبت نشده است"
       end
        else
     about = "*Group Description :*\n"..data[tostring(chat)]['about']
      end
    return about
  end
  if matches[1] == 'filter' and is_mod(msg) or matches[1] == 'فیلتر' and is_mod(msg) or  matches[1] == 'Filter' and is_mod(msg) then
    return filter_word(msg, matches[2])
  end
  if matches[1] == 'unfilter' and is_mod(msg) or matches[1] == 'حذف فیلتر' and is_mod(msg) or matches[1] == 'Unfilter' and is_mod(msg) then
    return unfilter_word(msg, matches[2])
  end
  if matches[1]:lower() == 'config' and is_admin(msg) or matches[1] == 'پیکربندی' and is_admin(msg) then
tdcli.getChannelMembers(msg.to.id, 0, 'Administrators', 200, config_cb, {chat_id=msg.to.id})
  end
  if matches[1] == 'filterlist' and is_mod(msg) or  matches[1] == 'لیست فیلتر' and is_mod(msg) or matches[1] == 'Filterlist' and is_mod(msg) then
    return filter_list(msg)
  end
if matches[1] == "settings" or matches[1] == "تنظیمات" or matches[1] == "Settings" then
return group_settings(msg, target)
end
if matches[1] == "modlist" or matches[1] == "لیست ناظم" or matches[1] == "Modlist" then
return modlist(msg)
end
if (matches[1]:lower() == "whitelist" or matches[1] == 'لیست سفید') and not matches[2] then
return whitelist(msg.to.id)
end
if matches[1] == "ownerlist" and is_owner(msg) or  matches[1] == "لیست مالکان" and is_owner(msg) or matches[1] == "Ownerlist" and is_owner(msg)  then
 return ownerlist(msg)
end

if matches[1] == "setlang" and is_owner(msg) or matches[1] == "تنظیم زبان" and is_owner(msg) or matches[1] == "Setlang" and is_owner(msg) then
   if matches[2] == "en" or matches[2] == "انگلیسی" then
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 redis:del(hash)
return "_gяøυρ lαиgυαge šeт тø:_ EN✅\n*øяđeявч*: [@"..check_markdown(msg.from.username or "sudoX").."]\n @luxurybots"
  elseif matches[2] == "fa" or matches[2] == "فارسی" then
redis:set(hash, true)
return "*زبان گروه تنظیم شد به : فارسی*\nسفارش توسط : [@"..check_markdown(msg.from.username or "sudoX").."]\n‌ @luxurybots"
end
end

 if matches[1] == 'mutetime' and is_mod(msg) or matches[1] == 'Mutetime' and is_mod(msg) or matches[1] == 'زمان بیصدا' and is_mod(msg) then
local hash = 'muteall:'..msg.to.id
local hour = tonumber(matches[2])
local num1 = (tonumber(hour) * 3600)
local minutes = tonumber(matches[3])
local num2 = (tonumber(minutes) * 60)
local second = tonumber(matches[4])
local num3 = tonumber(second) 
local num4 = tonumber(num1 + num2 + num3)
redis:setex(hash, num4, true)
if not lang then
 return "_Mute all has been enabled for_ \n⏺ *hours :* `"..matches[2].."`\n⏺ *minutes :* `"..matches[3].."`\n⏺ *seconds :* `"..matches[4].."`"..""
 elseif lang then
 return "بی صدا کردن فعال شد در \n⏺ ساعت : "..matches[2].."\n⏺ دقیقه : "..matches[3].."\n⏺ ثانیه : "..matches[4]..""
 end
 end
 if matches[1] == 'mutehours' or matches[1] == 'Mutehours' or matches[1]== 'ساعت بیصدا' and is_mod(msg) then
       local hash = 'muteall:'..msg.to.id
local hour = matches[2]
local num1 = tonumber(hour) * 3600
local num4 = tonumber(num1)
redis:setex(hash, num4, true)
if not lang then
 return "Mute all has been enabled for \n⏺ hours : "..matches[2]..""
 elseif lang then
 return "بی صدا کردن فعال شد در \n⏺ ساعت : "..matches[2]..""
 end
 end
  if matches[1] == 'muteminutes' or matches[1] == 'Muteminutes' or matches[1]== 'دقیقه بیصدا'  and is_mod(msg) then
 local hash = 'muteall:'..msg.to.id
local minutes = matches[2]
local num2 = tonumber(minutes) * 60
local num4 = tonumber(num2)
redis:setex(hash, num4, true)
if not lang then
 return "Mute all has been enabled for \n⏺ minutes : "..matches[2]..""
 elseif lang then
 return "بی صدا کردن فعال شد در \n⏺ دقیقه : "..matches[2]..""
 end
 end
  if matches[1] == 'muteseconds' or matches[1] == 'Muteseconds' or matches[1] == 'ثانیه بیصدا'  and is_mod(msg) then
       local hash = 'muteall:'..msg.to.id
local second = matches[2]
local num3 = tonumber(second) 
local num4 = tonumber(num3)
redis:setex(hash, num3, true)
if not lang then
 return "Mute all has been enabled for \n⏺ seconds : "..matches[2]..""
 elseif lang then
 return "بی صدا کردن فعال شد در \n⏺ ثانیه : "..matches[2]..""
 end
 end
 if (matches[1] == 'muteall' or matches[1] == 'Muteall' or matches[1] == 'موقعیت') and (matches[2] == 'status' or matches[2] == 'بیصدا') and is_mod(msg) then
         local hash = 'muteall:'..msg.to.id
      local mute_time = redis:ttl(hash)
		
		if tonumber(mute_time) < 0 then
		if not lang then
		return '_Mute All is Disable._'
		else
		return '_بیصدا بودن گروه غیر فعال است._'
		end
		else
		if not lang then
          return mute_time.." Sec"
		  elseif lang then
		  return mute_time.."ثانیه"
		end
		end
  end

if matches[1] == "help" and is_mod(msg) or matches[1] == "Help" and is_mod(msg) or matches[1] == "راهنما" and is_mod(msg) then
if not lang then
text = [[🔖help **luxurybots**

⚡️*тo ѕee тнe coммαɴdѕ oғ yoυr deѕιred ιтeм ѕυвмιт*

🌐 _ҽɳɠʅιʂԋ cσɱɱαɳԃʂ :_

🔺 `To Get Help Sudo`
*°•~>> SudoHelp*
➖〰➖〰➖〰➖〰➖
🔺 `To Get Help Mod`
*°•~>> Modhelp*
➖〰➖〰➖〰➖〰➖
🔺 `To Get Help Lock`
*°•~>> Lockhelp*
➖〰➖〰➖〰➖〰➖
🔺 `To Get Help Mute`
*°•~>> Mutehelp*
➖〰➖〰➖〰➖〰➖
🔺 `To Get Help MuteTime`
*°•~>> Mutetimehelp*
➖〰➖〰➖〰➖〰➖
🔺 `To Get Help Fun`
*°•~>> Funhelp*
➖〰➖〰➖〰➖〰➖

> ℓαηgυαgє вσт єηgℓιѕн !
_To Change The LanGuage_ 
*Setlang* `[en , fa]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
elseif lang then
text = [[🔖 **help luxurybots**

⚡️*برای دیدن دستورات مورد نظر خود ، مورد دلخواه را ارسال کنید*

💠_دستورات فارسی :_

🎗*°•~>>  راهنمای سودو۰*

🔹#دستورات‌صاحب‌ربات 🙄👆🏻
➖〰➖〰➖〰➖〰➖
🎗*°•~>>  راهنمای قفلی*

🔸#دستورات‌قفلی 🙄👆🏻
➖〰➖〰➖〰➖〰➖
🎗*°•~>>  راهنمای بیصدا*

🔹#دستورات‌بیصدا 🙄👆🏻
➖〰➖〰➖〰➖〰➖
🎗*°•~>>  راهنمای مدیریتی*

🔸#دستورات‌مدیریتی 🙄👆🏻
➖〰➖〰➖〰➖〰➖
🎗*°•~>>  راهنمای بیصدازمانی*

🔹#دستورات‌بیصدازمانی 🙄👆🏻
➖〰➖〰➖〰➖〰➖
🎗*°•~>>  راهنمای فان*

🔸#دستورات‌سرگرم‌کننده 🙄👆🏻
➖〰➖〰➖〰➖〰➖

> زبان ربات فارسی !
_برای تغییر زبان_
 *تنظیم زبان* `[فارسی , انگلسیی]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
end
return text
end

if matches[1] == "sudohelp" and is_mod(msg) or  matches[1] == "Sudohelp" and is_mod(msg) or  matches[1] == "راهنمای سودو" and is_mod(msg) then
text = [[
🔖help **luxurybots**

⚡️*тo ѕee тнe coммαɴdѕ oғ yoυr deѕιred ιтeм ѕυвмιт*

🌐 _ҽɳɠʅιʂԋ cσɱɱαɳԃʂ :_

*Visudo* `[username|id|reply]`
🔹_اضافه کردن سودو_

*Desudo* `[username|id|reply]`
🔸_حذف کردن سودو_

*Sudolist* 
🔹_لیست سودو‌های ربات_

*Adminprom* `[username|id|reply]`
🔸_اضافه کردن ادمین به ربات_

*Admindem* `[username|id|reply]`
🔹_حذف فرد از ادمینی ربات_

*Adminlist* 
🔸_لیست ادمین ها_

*Leave* 
🔹_خارج شدن ربات از گروه_

*Autoleave* `[disable/enable]`
🔸_خروج خودکار_

*Creategroup* `[text]`
🔹_ساخت گروه ریلم_

*Createsuper* `[text]`
🔸_ساخت سوپر گروه_

*Tosuper* 
🔹_تبدیل به سوپر گروه_

*Chats*
🔸_لیست گروه های مدیریتی ربات_

*Join* `[id]`
🔹_جوین شدن توسط ربات_

*Rem* `[id]`
🔸_حذف گروه ازطریق پنل مدیریتی_

*Import* `[link]`
🔹_جوین شدن ربات توسط لینک_

*Setbotname* `[text]`
🔸_تغییر اسم ربات_

*Setbotusername* `[text]`
🔹_تغییر یوزرنیم ربات_

*Delbotusername* 
🔸_پاک کردن یوزرنیم ربات_

*Markread* `[off/on]`
🔹_تیک دوم_

*Broadcast* `[text]`
🔸_فرستادن پیام به تمام گروه های مدیریتی ربات_

*Bc* `[text]` `[gpid]`
🔹_ارسال پیام مورد نظر به گروه خاص_

*Sendfile* `[cd]` `[file]`
🔸_ارسال فایل موردنظر از پوشه خاص_

*Sendplug* `[plug]`
🔹_ارسال پلاگ مورد نظر_

*Save* `[plugin name] [reply]`
🔸_ذخیره کردن پلاگین_

*Savefile* `[address/filename] [reply]`
🔹_ذخیره کردن فایل در پوشه مورد نظر_

*Clear cache*
🔸_پاک کردن کش مسیر .telegram-cli/data_

*Check*
🔹_اعلام تاریخ انقضای گروه_

*Check* `[GroupID]`
🔸_اعلام تاریخ انقضای گروه مورد نظر_

*Charge* `[GroupID]` `[Number Of Days]`
🔹_تنظیم تاریخ انقضای گروه مورد نظر_

*Charge* `[Number Of Days]`
🔸_تنظیم تاریخ انقضای گروه_

*Jointo* `[GroupID]`
🔹_دعوت شدن شما توسط ربات به گروه مورد نظر_

*Leave* `[GroupID]`
🔸_خارج شدن ربات از گروه مورد نظر_

*Setmanager* `[username|id|reply]`
🔹_تایین ادمین گروه در صورتی که ربات صاحب گروه باشد_

*Config*
🔸_تنظیم مالک گروه و ترفیع تمام مدیران گروه _

> ℓαηgυαgє вσт єηgℓιѕн !
_To Change The LanGuage_ 
*Setlang* `[en , fa]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
return text
end

if matches[1] == "lockhelp" and is_mod(msg) or matches[1] == "Lockhelp" and is_mod(msg) or matches[1] == "راهنمای قفلی" and is_mod(msg)then
if not lang then
text = [[
💠*EngliSh CoMmAnDs :*

#Lock commands 

🔒*Lock*  

`[link , username , hashtag , edit , arabic , webpage , bots , spam , flood , markdown , mention , emoji , ads , fosh,cmds,join]`

🔓*Unlock* 

 `[link , username , hashtag , edit , arabic , webpage , bots , spam , flood , markdown , mention , emoji , ads , fosh,cmds,join]`

 
 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
 ]]
elseif lang then
text = [[
💠_دستورات فارسی :_

#دستورات قفلی 

🔒*قفل*

`{لینک ، یوزرنیم ، هشتگ ، فراخوانی ، اسپم ، حساسیت ، ویرایش ، ربات ، مارکدون ، وب ، سنجاق ، انگلیسی ، عربی ، ویو ، امجو ، تبلیغات ، فحش،دستورات،ورود}`

🔓*بازکردن* 

`{لینک ، یوزرنیم ، هشتگ ، فراخوانی ، اسپم ، حساسیت ، ویرایش ، ربات ، مارکدون ، وب ، سنجاق ، انگلیسی ، عربی ، ویو ، امجو ، تبلیغات ، فحش،دستورات،ورود}`

*> زبان ربات فارسی !*
_برای تغییر زبان_ `[تنظیم زبان]` `[فارسی , انگلسیی]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
end
return text
end

if matches[1] == "mutehelp" and is_mod(msg) or matches[1] == "Mutehelp" and is_mod(msg) or matches[1] == "راهنمای بیصدا" and is_mod(msg)then
if not lang then
text = [[
#Mute commands

🔇*Mute* 

`[gif , photo , document , sticker , video , text , forward , location , audio , voice , contact ,tgservice , inline , all , keyboard]`

🔊*Unmute*

 `[gif , photo , document , sticker , video , text , forward , location , audio , voice , contact, tgservice , inline , all , keybord]`
 
 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
elseif lang then
text = [[
#دستورات بیصدا

🔇*بیصدا *

`{همه ، گیف ، متن ، عکس ، ویدیو ، اهنگ ، ویس ، استیکر ، مخاطب ، فورواد ، کیبورد ، فایل ، مکان ، سرویس تلگرام ، بازی ، دکمه شیشه ای}`

🔊*باصدا *

`{همه ، گیف ، متن ، عکس ، ویدیو ، اهنگ ، ویس ، استیکر ، مخاطب ، فوروارد ، کیبورد ، فایل ، مکان ، سرویس تلگرام ، بازی ، دکمه شیشه ای}`

*> زبان ربات فارسی !*
_برای تغییر زبان_ `[تنظیم زبان]` `[فارسی , انگلسیی]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
end
return text
end

if matches[1] == "modhelp" and is_mod(msg) or matches[1] == "Modhelp" and is_mod(msg) or matches[1] == "راهنمای مدیریتی" and is_mod(msg) then
if not lang then
text = [[
💠*EngliSh CoMmAnDs :*

#Modhelp

*Setlang* `[fa - en]`
⚡️تنظیم زبان پاسخ گویی ربات به دستورات

*Silent* `[username , id , reply]`
💥ساکت کردن فرد (هر پیامی که فرد بدهد پاک میشود(

*Unsilent* `[username , id , reply]`
⚡️بازکردن ساکت بودن فرد 

*Kick* `[username , id , reply]`
💥اخراج فرد از گروه

*Ban* `[username , id , reply]`
⚡️مسدود کردن فرد و اجازه ورود مجدد ندادن

*Unban* `[username , id , reply]`
💥خارج شدن فرد از حالت مسدود 

*Delall* `[username , id , reply]`
⚡️پاک کردن تمام پیام هایی که فرد داده است در گروه

*Filter* `[text]`
💥فیلتر کلمه مورد نظر و پاک شدن ان

*Unfilter* `[text]`
⚡️حذف کلمه مورد نظر از لیست فیلتر

*Welcome* `[enable-disable]`
💥روشن و خاموش کردن خوش امد گوی

*Promote* `[username , id , reply]`
💥تنظیم فرد به عنوان معاون ربات در گروه

*Demote* `[username , id , reply]`
💥تنزل مقام فرد از معاون ربات برای گروه

*Settings*
⚡️دریافت لیست تنظیمات

*Modelist*
💥دریافت لیست معاون های گروه

*Ownerlist*
⚡️دریافت لیست مدیران گروه 

*Silentlist*
💥دریافت لیست ساکت ها

*Filterlist*
⚡️دریافت لیست کلمات فیلتر

*Setflood* `[1-50]`
💥تنظیم حساسیت پیام مکرر

*Set* `[rules , name , link , about]`
⚡️تنظیم به ترتیب [قوانین ، اسم ، لینک ، درباره ، ] برای گروه

*Setwelcome* `[text]`
💥تنظیم خوش امد برای گروه

*Res* `[username]`
⚡️نمایش اطلاعات یوزرنیم

*Whois* `[id]`
💥نمایش اطلاعات برای ایدی عددی

*Pin* `[reply]`
⚡️پین پیام مورد نظر در گروه

*Unpin* `[reply]`
💥برداشتن پیام از حالت پین

*Rules* 
⚡️نمایش قوانین گروه

*About*
💥نمایش درباره گروه

*Gpinfo*
⚡️نمایش اطلاعات گروه

*Link*
💥دریافت لینک گروه

 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
elseif lang then
text = [[
💠_دستورات فارسی :_

#دستورات مدیریتی

*تنظیم زبان* `[فارسی - انگلیسی]`
⚡️تنظیم زبان پاسخ گویی ربات به دستورات

*خفه* `[username , id , reply]`
💥ساکت کردن فرد (هر پیامی که فرد بدهد پاک میشود)

*ان خفه* `[username , id , reply]`
⚡️بازکردن ساکت بودن فرد 

*اخراج* `[username , id , reply]`
💥اخراج فرد از گروه

*مسدود* `[username , id , reply]`
⚡️مسدود کردن فرد و اجازه ورود مجدد ندادن

*رفع مسدود* `[username , id , reply]`
💥خارج شدن فرد از حالت مسدود 

*حذف پیام* `[username , id , reply]`
⚡️پاک کردن تمام پیام هایی که فرد داده است در گروه

*فیلتر* `[text]`
💥فیلتر کلمه مورد نظر و پاک شدن ان

*ان فیلتر* `[text]`
⚡️حذف کلمه مورد نظر از لیست فیلتر

*ولکام* `[فعال-غیر فعال]`
💥فعال و غیر فعال کردن خوش آمد گوی

*ترفیع* `[username , id , reply]`
🔥تنظیم فرد به عنوان معاون ربات در گروه

*تنزل* `[username , id , reply]`
⚡تنزل مقام فرد از معاون ربات برای گروه

*تنظیمات*
⚡️دریافت لیست تنظیمات

*لیست ناظم*
💥دریافت لیست معاون های گروه

*لیست مالکان*
⚡️دریافت لیست مدیران گروه 

*لیست ساکت*
💥دریافت لیست ساکت ها

*لیست فیلتر*
⚡️دریافت لیست کلمات فیلتر

*حساسیت اسپم* `[1-50]`
💥تنظیم حساسیت پیام مکرر

⚡️*تنظیم* 
`[قوانین ، لینک ، درباره گروه، ]`

*تنظیم ولکام* `[text]`
⚡️تنظیم خوش امد برای گروه

*رس* `[username]`
💥نمایش اطلاعات یوزرنیم

*شخص* `[id]`
⚡️نمایش اطلاعات برای ایدی عددی

*سنجاق* `[reply]`
💥پین پیام مورد نظر در گروه

*برداشتن سنجاق* `[reply]`
⚡️برداشتن پیام از حالت پین

*قوانین* 
💥نمایش قوانین گروه

*اطلاعات گروه*
⚡️نمایش اطلاعات گروه

*لینک*
💥دریافت لینک گروه

*> زبان ربات فارسی !*
_برای تغییر زبان_ `[تنظیم زبان]` `[فارسی , انگلسیی]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
end
return text
end

if matches[1] == "funhelp" and is_mod(msg) or matches[1] == "Funhelp" and is_mod(msg) or matches[1] == "راهنمای فان" and is_mod(msg)then
if not lang then
text = [[
💠*EngliSh CoMmAnDs :*

*Azan* `[name city]`
⚜دریافت اطلاعات اذان شهر مورد نظر

*Info*
🔻دریافت اطلاعات شما

*Me*
⚜دریافت مقام شما در ربات

*Ping*
🔻اطلاع از انلاین بودن ربات

*Time*
⚜دریافت زمان و تاریخ امروز

*Write* `[text]`
🔻نوشتن کلمه با ۱۰۰ فونت مختلف

*Nerkh*
⚜دریافت قیمت ربات جهت خرید

*Weather* `[city]`
🔻دریافت اب وهوا شهر مورد نظر

*Calc* `[number]`
⚜ماشین حساب 

*Tr* `[lang] [word]`
🔻ترجمه متن فارسی به انگلیسی وبرعکس
_مثال:_
_Tr en سلام_

*Short* `[link]`
⚜کوتاه کننده لینک

*Voice* `[text]`
🔻تبدیل متن به صدا

*Sticker* `[word]`
⚜تبدیل متن به استیکر

*Photo* `[word]`
🔻تبدیل متن به عکس

*Tosticker* `[reply]`
⚜تبدیل عکس به استیکر

*Tophoto* `[reply]`
🔻تبدیل استیکر‌ به عکس

 *> LanGuage BoT EngliSh !*
_To Change The LanGuage_ `[Setlang]` `[en , fa]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
elseif lang then
text = [[
💠_دستورات فارسی :_

*اذان* [نام شهر]
⚜دریافت اطلاعات اذان شهر مورد نظر

*اطلاعات من*
🔻دریافت اطلاعات شما

*مقام من*
⚜دریافت مقام شما در ربات

*انلاینی*
🔻اطلاع از انلاین بودن ربات

*ساعت*
⚜دریافت زمان و تاریخ امروز

*نوشتن* [متن]
🔻نوشتن کلمه با ۱۰۰ فونت مختلف

*نرخ*
⚜دریافت قیمت ربات جهت خرید

*اب و هوا* `[شهر]`
🔻دریافت اب وهوا شهر مورد نظر

*حساب* `[عدد]`
⚜ماشین حساب 

*ترجمه* `[زبان] [کلمه]`
🔻ترجمه متن فارسی به انگلیسی وبرعکس
_مثال:_
_ترجمه en سلام_

*کوتاه* `[لینک]`
⚜کوتاه کننده لینک

*ویس* `[متن]`
🔻تبدیل متن به صدا

*استیکر* `[کلمه]`
⚜تبدیل متن به استیکر

*ععکس* `[کلمه]`
🔻تبدیل متن به عکس

*به ااستیکر* `[ریپلای]`
⚜تبدیل عکس به استیکر

*به عکس* `[ریپلای]`
🔻تبدیل استیکر‌ به عکس

*> زبان ربات فارسی !*
_برای تغییر زبان_ `[تنظیم زبان]` `[فارسی , انگلسیی]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
end
return text
end


if matches[1] == "nerkh" or matches[1] == "Nerkh" or matches[1] == "نرخ" then
text = [[
`💵 نرخ فروش گروه با ربات`
**luxurybots**

✳️برای گروه های زیر 3000 نفر ‌
➰1 ماهه  5 هزار تومان
➰3 ماهه 12 هزار تومان
➰6 ماهه 20 هزار تومان

〰〰〰〰〰〰〰
✳️برای گروه های بالای 3000 نفر 
➰1 ماهه  6 هزار تومان
➰3 ماهه  14 هزار تومان
➰6 ماهه 24 هزار تومان
*〰〰〰〰〰〰〰*
1⃣._توجه داشته باشید به هیچ وجه نباید ربات رو از گروه حذف کنید و در صورت داشتن هرگونه مشکل فقط اون رو از ادمینی گروه بردارید و به بنده مراجعه کنید._

2⃣._لازم به ذکره اولویت بصورت پرداخت کارت به کارت میباشد._

3⃣._ربات داعمی نداریم به علت کیفیت و کارای بالای ربات._
*________________*
*برای خرید به ایدی زیر مراجعه کنید :*
🆔: @sudoX
*و اگر ریپورت هستید به :*
🆔: @GFAKEMBoT
]]
return text
end

if matches[1] == "ping" or matches[1] == "Ping" or matches[1] == "انلاینی" then
text = [[
اره عزیزم
]]
return text
end

if matches[1] == "mutetimehelp" or matches[1] == "Mutetimehelp" or matches[1] == "راهنمای بیصدازمانی" then
if not lang then
text = [[
**luxurybots**:

*⚡️тo ѕee тнe coммαɴdѕ oғ yoυr deѕιred ιтeм ѕυвмιт*

🌐 ҽɳɠʅιʂԋ cσɱɱαɳԃʂ :

*°•~>> Mute all*
🔹Mute groups
➖〰➖〰➖〰➖〰➖
*°•~>> Mute* (hour) (minute)  (seconds)
🔸Mute group at this time 
➖〰➖〰➖〰➖〰➖
*°•~>> Mutehours* (number)
🔹Mute group at this time 
➖〰➖〰➖〰➖〰➖
*°•~>> Muteminutes* (number)
🔸Mute group at this time 
➖〰➖〰➖〰➖〰➖
*°•~>> Muteseconds* (number)
🔹Mute group at this time 
➖〰➖〰➖〰➖〰➖
*°•~>> Unmute all*
🔸Unmute group at this time 
➖〰➖〰➖〰➖〰➖

*> LanGuage BoT EngliSh !*
_To Change The LanGuage_
*°•~>> Setlang* [en , fa]

➖〰➖〰➖〰➖〰➖
💻 ρσωєяɗ Ɓу : @sudoX
🎭 ƇнαηηєƖ : @luxurybots
]]
elseif lang then
text = [[
بیصدا همه
Mute groups
بیصدا (hour) (minute) (seconds)
Mute group at this time 
ساعت بیصدا (number)
Mute group at this time 
دقیقه بیصدا (number)
Mute group at this time 
ثانیه بیصدا (number)
Mute group at this time 
بازکردن همه
Unmute group at this time 

*> زبان ربات فارسی !*
_برای تغییر زبان_ `[تنظیم زبان]` `[فارسی , انگلسیی]`

➖〰➖〰➖〰➖〰➖
💻 *ρσωєяɗ Ɓу :* @sudoX
🎭 *ƇнαηηєƖ :* @luxurybots
]]
end
return text
end

--------------------- Welcome -----------------------
	if matches[1] == "welcome" and is_mod(msg) or matches[1] == "Welcome" and is_mod(msg) or matches[1] == "ولکام" and is_mod(msg) then
		if matches[2] == "enable" or matches[2] == "فعال" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "yes" then
       if not lang then
				return "_Group_ *welcome* _is already enabled_"
       elseif lang then
				return "_خوشآمد گویی از قبل فعال بود_"
           end
			else
		data[tostring(chat)]['settings']['welcome'] = "yes"
	    save_data(_config.moderation.data, data)
       if not lang then
				return "_Group_ *welcome* _has been enabled_"
       elseif lang then
				return "_خوشآمد گویی فعال شد_"
          end
			end
		end
		
		if matches[2] == "disable" or matches[2] == "غیر فعال" then
			welcome = data[tostring(chat)]['settings']['welcome']
			if welcome == "no" then
      if not lang then
				return "_Group_ *Welcome* _is already disabled_"
      elseif lang then
				return "_خوشآمد گویی از قبل فعال نبود_"
         end
			else
		data[tostring(chat)]['settings']['welcome'] = "no"
	    save_data(_config.moderation.data, data)
      if not lang then
				return "_Group_ *welcome* _has been disabled_"
      elseif lang then
				return "_خوشآمد گویی غیرفعال شد_"
          end
			end
		end
	end
	if matches[1] == "setwelcome" and matches[2] and is_mod(msg) or matches[1] == "Setwelcome" and matches[2] and is_mod(msg) or matches[1] == "تنظیم ولکام" and matches[2] and is_mod(msg) then
		data[tostring(chat)]['setwelcome'] = matches[2]
	    save_data(_config.moderation.data, data)
       if not lang then
		return "_Welcome Message Has Been Set To :_\n*"..matches[2].."*\n\n*You can use :*\n_{gpname} Group Name_\n_{rules} ➣ Show Group Rules_\n_{name} ➣ New Member First Name_\n_{username} ➣ New Member Username_"
       else
		return "_پیام خوشآمد گویی تنظیم شد به :_\n*"..matches[2].."*\n\n*شما میتوانید از*\n_{gpname} نام گروه_\n_{rules} ➣ نمایش قوانین گروه_\n_{name} ➣ نام کاربر جدید_\n_{username} ➣ نام کاربری کاربر جدید_\n_استفاده کنید_"
        end
     end
	end
end
end	
-----------------------------------------
local function pre_process(msg)
   local chat = msg.to.id
   local user = msg.from.id
 local data = load_data(_config.moderation.data)
	local function welcome_cb(arg, data)
local hash = "gp_lang:"..arg.chat_id
local lang = redis:get(hash)
		administration = load_data(_config.moderation.data)
    if administration[arg.chat_id]['setwelcome'] then
     welcome = administration[arg.chat_id]['setwelcome']
      else
     if not lang then
     welcome = "*Welcome Dude*"
    elseif lang then
     welcome = "_خوش آمدید_"
        end
     end
 if administration[tostring(arg.chat_id)]['rules'] then
rules = administration[arg.chat_id]['rules']
else
   if not lang then
     rules = "ℹ️ The Default Rules :\n1⃣ No Flood.\n2⃣ No Spam.\n3⃣ No Advertising.\n4⃣ Try to stay on topic.\n5⃣ Forbidden any racist, sexual, homophobic or gore content.\n➡️ Repeated failure to comply with these rules will cause ban."
    elseif lang then
       rules = "ℹ️ قوانین پپیشفرض:\n1⃣ ارسال پیام مکرر ممنوع.\n2⃣ اسپم ممنوع.\n3⃣ تبلیغ ممنوع.\n4⃣ سعی کنید از موضوع خارج نشید.\n5⃣ هرنوع نژاد پرستی, شاخ بازی و پورنوگرافی ممنوع .\n➡️ از قوانین پیروی کنید, در صورت عدم رعایت قوانین اول اخطار و در صورت تکرار مسدود."
 end
end
if data.username_ then
user_name = "@"..check_markdown(data.username_)
else
user_name = ""
end
		local welcome = welcome:gsub("{rules}", rules)
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_))
		local welcome = welcome:gsub("{username}", user_name)
		local welcome = welcome:gsub("{gpname}", arg.gp_name)
		tdcli.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
	if msg.adduser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.adduser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
		else
			return false
		end
	end
	if msg.joinuser then
		welcome = data[tostring(msg.to.id)]['settings']['welcome']
		if welcome == "yes" then
			tdcli_function ({
	      ID = "GetUser",
      	user_id_ = msg.joinuser
    	}, welcome_cb, {chat_id=chat,msg_id=msg.id,gp_name=msg.to.title})
		else
			return false
        end
		end
	end
-- return msg
 end
return {
patterns ={
"^[!/#]([Ii]d)$",
"^([Ii]d)$",
"^(آیدی)$",
"^(ایدی)$",
"^[!/#]([Ii]d) (.*)$",
"^([Ii]d) (.*)$",
"^(آیدی) (.*)$",
"^(ایدی) (.*)$",
"^[!/#]([Pp]in)$",
"^([Pp]in)$",
"^(سنجاق)$",
"^[!/#]([Uu]npin)$",
"^([Uu]npin)$",
"^(برداشتن سنجاق)$",
"^[!/#]([Gg]pinfo)$",
"^([Gg]pinfo)$",
"^(اطلاعات گروه)$",
"^[!/#]([Aa]dd)$",
"^([Aa]dd)$",
"^(نصب)$",
"^[!/#]([Rr]em)$",
"^([Rr]em)$",
"^(لغو نصب)$",
"^[!/#]([Ss]etowner)$",
"^([Ss]etowner)$",
"^(تنظیم مالک)$",
"^[!/#]([Ss]etowner) (.*)$",
"^([Ss]etowner) (.*)$",
"^(تنظیم مالک) (.*)$",
"^[!/#]([Rr]emowner)$",
"^([Rr]emowner)$",
"^(حذف مالک)$",
"^[!/#]([Rr]emowner) (.*)$",
"^([Rr]emowner) (.*)$",
"^(حذف مالک) (.*)$",
"^[!/#]([Pp]romote)$",
"^([Pp]romote)$",
"^(ترفیع)$",
"^[!/#]([Pp]romote) (.*)$",
"^([Pp]romote) (.*)$",
"^(ترفیع) (.*)$",
"^[!/#]([Dd]emote)$",
"^([Dd]emote)$",
"^(تنزل)$",
"^[!/#]([Dd]emote) (.*)$",
"^([Dd]emote) (.*)$",
"^(تنزل) (.*)$",
"^[!/#]([Mm]odlist)$",
"^([Mm]odlist)$",
"^(لیست ناظم)$",
"^[!/#]([Oo]wnerlist)$",
"^([Oo]wnerlist)$",
"^(لیست مالکان)$",
"^[!/#]([Ll]ock) (.*)$",
"^([Ll]ock) (.*)$",
"^(قفل) (.*)$",
"^[!/#]([Uu]nlock) (.*)$",
"^([Uu]nlock) (.*)$",
"^(بازکردن) (.*)$",
"^[!/#]([Ss]ettings)$",
"^([Ss]ettings)$",
"^(تنظیمات)$",
"^[!/#]([Mm]ute) (.*)$",
"^([Mm]ute) (.*)$",
"^(بیصدا) (.*)$",
"^[!/#]([Uu]nmute) (.*)$",
"^([Uu]nmute) (.*)$",
"^(باصدا) (.*)$",
"^[!/#]([Ll]ink)$",
"^([Ll]ink)$",
"^(لینک)$",
"^[!/#]([Ll]inkpv)$",
"^([Ll]inkpv)$",
"^(لینک پیوی)$",
"^[!/#]([Ss]etlink)$",
"^([Ss]etlink)$",
"^(تنظیم لینک)$",
"^[!/#]([Nn]ewlink)$",
"^([Nn]ewlink)$",
"^(لینک جدید)$",
"^[!/#]([Rr]ules)$",
"^([Rr]ules)$",
"^(قوانین)$",
"^[!/#]([Ss]etrules) (.*)$",
"^([Ss]etrules) (.*)$",
"^(تنظیم قوانین) (.*)$",
"^[!/#]([Aa]bout)$",
"^([Aa]bout)$",
"^(درباره گروه)$",
"^[!/#]([Ss]etabout) (.*)$",
"^([Ss]etabout) (.*)$",
"^(تنظیم درباره گروه) (.*)$",
"^[!/#]([Ss]etname) (.*)$",
"^([Ss]etname) (.*)$",
"^(تنظیم نام) (.*)$",
"^[!/#]([Cc]lean) (.*)$",
"^([Cc]lean) (.*)$",
"^(پاک کردن) (.*)$",
"^[!/#]([Ss]etflood) (%d+)$",
"^([Ss]etflood) (%d+)$",
"^(حساسیت اسپم) (%d+)$",
"^[!/#]([Rr]es) (.*)$",
"^([Rr]es) (.*)$",
"^(رس) (.*)$",
"^[!/#]([Ww]hois) (%d+)$",
"^([Ww]hois) (%d+)$",
"^(شخص) (%d+)$",
"^[!/#]([Hh]elp)$",
"^([Hh]elp)$",
"^(راهنما)$",
"^[!/#]([Ss]udohelp)$",
"^([Ss]udohelp)$",
"^(راهنمای سودو)$",
"^[!/#]([Ll]ockhelp)$",
"^([Ll]ockhelp)$",
"^(راهنمای قفلی)$",
"^[!/#]([Mm]odhelp)$",
"^([Mm]odhelp)$",
"^(راهنمای مدیریتی)$",
"^[!/#]([Ff]unhelp)$",
"^([Ff]unhelp)$",
"^(راهنمای فان)$",
"^[!/#]([Ss]etlang) (.*)$",
"^([Ss]etlang) (.*)$",
"^(تنظیم زبان) (.*)$",
"^[#!/]([Ff]ilter) (.*)$",
"^([Ff]ilter) (.*)$",
"^(فیلتر) (.*)$",
"^[#!/]([Uu]nfilter) (.*)$",
"^([Uu]nfilter) (.*)$",
"^(حذف فیلتر) (.*)$",
"^[#!/]([Ff]ilterlist)$",
"^([Ff]ilterlist)$",
"^(لیست فیلتر)$",
"^([https?://w]*.?t.me/joinchat/%S+)$",
"^([https?://w]*.?telegram.me/joinchat/%S+)$",
"^[!/#]([Ss]etwelcome) (.*)",
"^([Ss]etwelcome) (.*)",
"^(تنظیم ولکام) (.*)",
"^[!/#]([Ww]elcome) (.*)$",
"^([Ww]elcome) (.*)$",
"^(ولکام) (.*)$",
"^[!/#]([Nn]erkh)$",
"^([Nn]erkh)$",
"^(نرخ)$",
"^[!/#]([Pp]ing)$",
"^([Pp]ing)$",
"^(انلاینی)$",
"^[!/#]([Mm]utetimehelp)$",
"^([Mm]utetimehelp)$",
"^(راهنمای بیصدازمانی)$",
"^[!/#]([Mm]utehelp)$",
"^([Mm]utehelp)$",
"^(راهنمای بیصدا)$",
"^[#!/]([Cc]onfig)$",
"^([Cc]onfig)$",
"^(پیکربندی)$",
"^[#!/]([Cc]mds) (.*)$",
"^([Cc]mds) (.*)$",
"^(دستورات) (.*)$",
"^[#!/]([Mm]utetime) (%d+) (%d+) (%d+)$",
"^([Mm]utetime) (%d+) (%d+) (%d+)$",
"^(زمان بیصدا) (%d+) (%d+) (%d+)$",
"^[#!/]([Mm]utehours) (%d+)$",
"^([Mm]utehours) (%d+)$",
"^(ساعت بیصدا) (%d+)$",
"^[#!/]([Mm]uteminutes) (%d+)$",
"^([Mm]uteminutes) (%d+)$",
"^(دقیقه بیصدا) (%d+)$",
"^[#!/]([Mm]uteseconds) (%d+)$",
"^([Mm]uteseconds) (%d+)$",
"^(ثانیه بیصدا) (%d+)$",
"^[#!/]([Mm]uteall) (status)$",
"^([Mm]uteall) (status)$",
"^(موقعیت) (بیصدا)$",
"[#!/]([Ss]etchar) (%d+)$",
"^([Ss]etchar) (%d+)$",
"^(حداکثر حروف مجاز) (%d+)$",
"[#!/]([Ss]etfloodtime) (%d+)$",
"^([Ss]etfloodtime) (%d+)$",
"^(تنظیم زمان بررسی) (%d+)$",
"[#!/]([Ww]hitelist) ([+-])$",
"^([Ww]hitelist) ([+-])$",
"^(لیست سفید) ([+-])$",
"^[#!/]([Ww]hitelist)$",
"^([Ww]hitelist)$",
"^(لیست سفید)$",
"^[#!/]([Ww]hitelist) ([+-]) (.*)$",
"^([Ww]hitelist) ([+-]) (.*)$",
"^(لیست سفید) ([+-]) (.*)$",
"([#!/][Ss]etmanager)$",
"([#!/][Ss]etmanager) (.*)$",
"([Ss]etmanager)$",
"([Ss]etmanager) (.*)$",
"^(ادمین گروه)$",
"^(ادمین گروه) (.*)$",
"([#!/][Rr]emmanager)$",
"([#!/][Rr]emmanager) (.*)$",
"([Rr]emmanager)$",
"([Rr]emmanager) (.*)$",
"^(حذف ادمین گروه) (.*)$",
"^(حذف ادمین گروه)$",
"^[!#/]([Dd]el) (%d*)$",
"^([Dd]el) (%d*)$",
"^[!#/]([Rr]msg) (%d*)$",
"^([Rr]msg) (%d*)$",
"^(حذف) (%d*)$",
},
run=run,
pre_process = pre_process
}
--End GroupManager.lua--
