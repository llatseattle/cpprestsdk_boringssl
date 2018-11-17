#include <cpprest/http_client.h>
#include <cpprest/ws_client.h>
#include <cpprest/ws_msg.h>
#include <iostream>
#include <string>

int main() {
  using namespace web::websockets;
  using namespace web::websockets::client;

  web::websockets::client::websocket_client client;
  std::string body_str1 =
      "{\"type\":\"subscribe\",\"channels\":[{\"name\": "
      "\"level2\",\"product_ids\":[\"BTC-USD\"]}, {\"name\": "
      "\"matches\",\"product_ids\":[\"BTC-USD\"]}]}";

  try {
    client.connect("wss://ws-feed.gdax.com").wait();
    websocket_outgoing_message msg;
    msg.set_utf8_message(body_str1);
    client.send(msg).wait();
    // get for all
    while (true) {
      client.receive()
          .then([](websocket_incoming_message ret_msg) {
            auto ret_str = ret_msg.extract_string().get();
            std::cout << ret_str << "\n";
          })
          .wait();
    }

    client.close().wait();
  } catch (const websocket_exception &e) {
    client.close().wait();
    throw;
  }
  return 0;
}