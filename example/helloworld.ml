open Lwt
open Telegram.Api

module MyBot = Mk (struct
  include BotDefaults
  let token = [%blob "../bot.token"]
end)

let () =
  Lwt_main.run begin
    MyBot.send_message ~chat_id:(int_of_string [%blob "../chat.id"])
                       ~text:"Hello, world"
                       ~reply_to:None
                       ~reply_markup:None
    >>= fun _ -> return ()
  end
