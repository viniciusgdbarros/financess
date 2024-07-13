defmodule FinancessWeb.SaldoControllerTest do
  use FinancessWeb.ConnCase

  import Financess.FinanceiroFixtures

  @create_attrs %{receita_mensal: 42, despesa_mensal: 42, saldo_mensal: 42}
  @update_attrs %{receita_mensal: 43, despesa_mensal: 43, saldo_mensal: 43}
  @invalid_attrs %{receita_mensal: nil, despesa_mensal: nil, saldo_mensal: nil}

  describe "index" do
    test "lists all saldototal", %{conn: conn} do
      conn = get(conn, ~p"/saldototal")
      assert html_response(conn, 200) =~ "Listing Saldototal"
    end
  end

  describe "new saldo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/saldototal/new")
      assert html_response(conn, 200) =~ "New Saldo"
    end
  end

  describe "create saldo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/saldototal", saldo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/saldototal/#{id}"

      conn = get(conn, ~p"/saldototal/#{id}")
      assert html_response(conn, 200) =~ "Saldo #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/saldototal", saldo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Saldo"
    end
  end

  describe "edit saldo" do
    setup [:create_saldo]

    test "renders form for editing chosen saldo", %{conn: conn, saldo: saldo} do
      conn = get(conn, ~p"/saldototal/#{saldo}/edit")
      assert html_response(conn, 200) =~ "Edit Saldo"
    end
  end

  describe "update saldo" do
    setup [:create_saldo]

    test "redirects when data is valid", %{conn: conn, saldo: saldo} do
      conn = put(conn, ~p"/saldototal/#{saldo}", saldo: @update_attrs)
      assert redirected_to(conn) == ~p"/saldototal/#{saldo}"

      conn = get(conn, ~p"/saldototal/#{saldo}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, saldo: saldo} do
      conn = put(conn, ~p"/saldototal/#{saldo}", saldo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Saldo"
    end
  end

  describe "delete saldo" do
    setup [:create_saldo]

    test "deletes chosen saldo", %{conn: conn, saldo: saldo} do
      conn = delete(conn, ~p"/saldototal/#{saldo}")
      assert redirected_to(conn) == ~p"/saldototal"

      assert_error_sent 404, fn ->
        get(conn, ~p"/saldototal/#{saldo}")
      end
    end
  end

  defp create_saldo(_) do
    saldo = saldo_fixture()
    %{saldo: saldo}
  end
end
