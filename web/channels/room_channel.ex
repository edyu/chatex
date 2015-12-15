defmodule Chatex.RoomChannel do
  use Phoenix.Channel

  def join("rooms:Lobby", _message, socket) do
    { :ok, socket }
  end

  def join("rooms:" <> _room_id, _message, socket) do
    { :ok, socket }
  end

  def handle_in("new_msg", %{"user" => user, "body" => body}, socket) do
    broadcast! socket, "new_msg", %{user: user, body: body}
    { :noreply, socket }
  end

  def handle_out("new_msg", data, socket) do
    push socket, "new_msg", data
    { :noreply, socket }
  end
end
