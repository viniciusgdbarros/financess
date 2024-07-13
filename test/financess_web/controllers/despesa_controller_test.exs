defmodule FinancessWeb.DespesaControllerTest do
  use FinancessWeb.ConnCase

  import Financess.FinanceiroFixtures

  @create_attrs %{gasto: "some gasto", valor: 42, parcela: 42, valorfinal: 42}
  @update_attrs %{gasto: "some updated gasto", valor: 43, parcela: 43, valorfinal: 43}
  @invalid_attrs %{gasto: nil, valor: nil, parcela: nil, valorfinal: nil}

  describe "index" do
    test "lists all despesas", %{conn: conn} do
      conn = get(conn, ~p"/despesas")
      assert html_response(conn, 200) =~ "Listing Despesas"
    end
  end

  describe "new despesa" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/despesas/new")
      assert html_response(conn, 200) =~ "New Despesa"
    end
  end

  describe "create despesa" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/despesas", despesa: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/despesas/#{id}"

      conn = get(conn, ~p"/despesas/#{id}")
      assert html_response(conn, 200) =~ "Despesa #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/despesas", despesa: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Despesa"
    end
  end

  describe "edit despesa" do
    setup [:create_despesa]

    test "renders form for editing chosen despesa", %{conn: conn, despesa: despesa} do
      conn = get(conn, ~p"/despesas/#{despesa}/edit")
      assert html_response(conn, 200) =~ "Edit Despesa"
    end
  end

  describe "update despesa" do
    setup [:create_despesa]

    test "redirects when data is valid", %{conn: conn, despesa: despesa} do
      conn = put(conn, ~p"/despesas/#{despesa}", despesa: @update_attrs)
      assert redirected_to(conn) == ~p"/despesas/#{despesa}"

      conn = get(conn, ~p"/despesas/#{despesa}")
      assert html_response(conn, 200) =~ "some updated gasto"
    end

    test "renders errors when data is invalid", %{conn: conn, despesa: despesa} do
      conn = put(conn, ~p"/despesas/#{despesa}", despesa: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Despesa"
    end
  end

  describe "delete despesa" do
    setup [:create_despesa]

    test "deletes chosen despesa", %{conn: conn, despesa: despesa} do
      conn = delete(conn, ~p"/despesas/#{despesa}")
      assert redirected_to(conn) == ~p"/despesas"

      assert_error_sent 404, fn ->
        get(conn, ~p"/despesas/#{despesa}")
      end
    end
  end

  defp create_despesa(_) do
    despesa = despesa_fixture()
    %{despesa: despesa}
  end
end
