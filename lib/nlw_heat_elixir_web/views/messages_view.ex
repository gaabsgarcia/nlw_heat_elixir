defmodule NlwHeatElixirWeb.MessagesView do
    use NlwHeatElixirWeb, :view
    def render("create.json", %{message: message}) do
        %{
            result: "Message created!",
            message: message
        }
    end
end