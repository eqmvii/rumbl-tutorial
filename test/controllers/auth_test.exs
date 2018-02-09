defmodule Rumbl.AuthTest do
    use Rumbl.ConnCase
    alias Rumbl.Auth

    test "authenticate_user halts when no current_user exists",
        %{conn: conn} do
            conn = Auth.authenticate_user(conn, [])
            assert conn.halted
        end
end