defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  alias Rocketpay.Numbers

  def index(con, %{"filename" => filename}) do
    filename
    |> Numbers.sum_from_file()
    |> handle_response(con)
    # text(con, "Welcome to the Rocketpay API")
  end

  defp handle_response({:ok, %{result: result}}, con) do
    con
    |> put_status(:ok)
    |> json(%{message: "Welcome to Rocketpay API. Number #{result}"})
  end

  defp handle_response({:error, msg}, con) do
    con
    |> put_status(:bad_request)
    |> json(msg)
  end
end
