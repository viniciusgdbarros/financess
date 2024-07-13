defmodule FinancessWeb.SaldooControllerTest do
  use FinancessWeb.ConnCase

  import Financess.FinanceiroFixtures

  @create_attrs %{saldoresultante: 42}
  @update_attrs %{saldoresultante: 43}
  @invalid_attrs %{saldoresultante: nil}

  describe "index" do
    test "lists all saldos", %{conn: conn} do
      conn = get(conn, ~p"/saldos")
      assert html_response(conn, 200) =~ "Listing Saldos"
    end
  end

  describe "new saldoo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/saldos/new")
      assert html_response(conn, 200) =~ "New Saldoo"
    end
  end

  describe "create saldoo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/saldos", saldoo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/saldos/#{id}"

      conn = get(conn, ~p"/saldos/#{id}")
      assert html_response(conn, 200) =~ "Saldoo #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/saldos", saldoo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Saldoo"
    end
  end

  describe "edit saldoo" do
    setup [:create_saldoo]

    test "renders form for editing chosen saldoo", %{conn: conn, saldoo: saldoo} do
      conn = get(conn, ~p"/saldos/#{saldoo}/edit")
      assert html_response(conn, 200) =~ "Edit Saldoo"
    end
  end

  describe "update saldoo" do
    setup [:create_saldoo]

    test "redirects when data is valid", %{conn: conn, saldoo: saldoo} do
      conn = put(conn, ~p"/saldos/#{saldoo}", saldoo: @update_attrs)
      assert redirected_to(conn) == ~p"/saldos/#{saldoo}"

      conn = get(conn, ~p"/saldos/#{saldoo}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, saldoo: saldoo} do
      conn = put(conn, ~p"/saldos/#{saldoo}", saldoo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Saldoo"
    end
  end

  describe "delete saldoo" do
    setup [:create_saldoo]

    test "deletes chosen saldoo", %{conn: conn, saldoo: saldoo} do
      conn = delete(conn, ~p"/saldos/#{saldoo}")
      assert redirected_to(conn) == ~p"/saldos"

      assert_error_sent 404, fn ->
        get(conn, ~p"/saldos/#{saldoo}")
      end
    end
  end

  defp create_saldoo(_) do
    saldoo = saldoo_fixture()
    %{saldoo: saldoo}
  end
end
