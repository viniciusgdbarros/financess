defmodule Financess.FinanceiroTest do
  use Financess.DataCase

  alias Financess.Financeiro

  describe "despesas" do
    alias Financess.Financeiro.Despesa

    import Financess.FinanceiroFixtures

    @invalid_attrs %{gasto: nil, valor: nil, parcela: nil, valorfinal: nil}

    test "list_despesas/0 returns all despesas" do
      despesa = despesa_fixture()
      assert Financeiro.list_despesas() == [despesa]
    end

    test "get_despesa!/1 returns the despesa with given id" do
      despesa = despesa_fixture()
      assert Financeiro.get_despesa!(despesa.id) == despesa
    end

    test "create_despesa/1 with valid data creates a despesa" do
      valid_attrs = %{gasto: "some gasto", valor: 42, parcela: 42, valorfinal: 42}

      assert {:ok, %Despesa{} = despesa} = Financeiro.create_despesa(valid_attrs)
      assert despesa.gasto == "some gasto"
      assert despesa.valor == 42
      assert despesa.parcela == 42
      assert despesa.valorfinal == 42
    end

    test "create_despesa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financeiro.create_despesa(@invalid_attrs)
    end

    test "update_despesa/2 with valid data updates the despesa" do
      despesa = despesa_fixture()
      update_attrs = %{gasto: "some updated gasto", valor: 43, parcela: 43, valorfinal: 43}

      assert {:ok, %Despesa{} = despesa} = Financeiro.update_despesa(despesa, update_attrs)
      assert despesa.gasto == "some updated gasto"
      assert despesa.valor == 43
      assert despesa.parcela == 43
      assert despesa.valorfinal == 43
    end

    test "update_despesa/2 with invalid data returns error changeset" do
      despesa = despesa_fixture()
      assert {:error, %Ecto.Changeset{}} = Financeiro.update_despesa(despesa, @invalid_attrs)
      assert despesa == Financeiro.get_despesa!(despesa.id)
    end

    test "delete_despesa/1 deletes the despesa" do
      despesa = despesa_fixture()
      assert {:ok, %Despesa{}} = Financeiro.delete_despesa(despesa)
      assert_raise Ecto.NoResultsError, fn -> Financeiro.get_despesa!(despesa.id) end
    end

    test "change_despesa/1 returns a despesa changeset" do
      despesa = despesa_fixture()
      assert %Ecto.Changeset{} = Financeiro.change_despesa(despesa)
    end
  end

  describe "receitas" do
    alias Financess.Financeiro.Receita

    import Financess.FinanceiroFixtures

    @invalid_attrs %{total: nil, salario: nil, rendaextra: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Financeiro.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Financeiro.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{total: 42, salario: 42, rendaextra: 42}

      assert {:ok, %Receita{} = receita} = Financeiro.create_receita(valid_attrs)
      assert receita.total == 42
      assert receita.salario == 42
      assert receita.rendaextra == 42
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financeiro.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{total: 43, salario: 43, rendaextra: 43}

      assert {:ok, %Receita{} = receita} = Financeiro.update_receita(receita, update_attrs)
      assert receita.total == 43
      assert receita.salario == 43
      assert receita.rendaextra == 43
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Financeiro.update_receita(receita, @invalid_attrs)
      assert receita == Financeiro.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Financeiro.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Financeiro.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Financeiro.change_receita(receita)
    end
  end

  describe "saldototal" do
    alias Financess.Financeiro.Saldo

    import Financess.FinanceiroFixtures

    @invalid_attrs %{receita_mensal: nil, despesa_mensal: nil, saldo_mensal: nil}

    test "list_saldototal/0 returns all saldototal" do
      saldo = saldo_fixture()
      assert Financeiro.list_saldototal() == [saldo]
    end

    test "get_saldo!/1 returns the saldo with given id" do
      saldo = saldo_fixture()
      assert Financeiro.get_saldo!(saldo.id) == saldo
    end

    test "create_saldo/1 with valid data creates a saldo" do
      valid_attrs = %{receita_mensal: 42, despesa_mensal: 42, saldo_mensal: 42}

      assert {:ok, %Saldo{} = saldo} = Financeiro.create_saldo(valid_attrs)
      assert saldo.receita_mensal == 42
      assert saldo.despesa_mensal == 42
      assert saldo.saldo_mensal == 42
    end

    test "create_saldo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financeiro.create_saldo(@invalid_attrs)
    end

    test "update_saldo/2 with valid data updates the saldo" do
      saldo = saldo_fixture()
      update_attrs = %{receita_mensal: 43, despesa_mensal: 43, saldo_mensal: 43}

      assert {:ok, %Saldo{} = saldo} = Financeiro.update_saldo(saldo, update_attrs)
      assert saldo.receita_mensal == 43
      assert saldo.despesa_mensal == 43
      assert saldo.saldo_mensal == 43
    end

    test "update_saldo/2 with invalid data returns error changeset" do
      saldo = saldo_fixture()
      assert {:error, %Ecto.Changeset{}} = Financeiro.update_saldo(saldo, @invalid_attrs)
      assert saldo == Financeiro.get_saldo!(saldo.id)
    end

    test "delete_saldo/1 deletes the saldo" do
      saldo = saldo_fixture()
      assert {:ok, %Saldo{}} = Financeiro.delete_saldo(saldo)
      assert_raise Ecto.NoResultsError, fn -> Financeiro.get_saldo!(saldo.id) end
    end

    test "change_saldo/1 returns a saldo changeset" do
      saldo = saldo_fixture()
      assert %Ecto.Changeset{} = Financeiro.change_saldo(saldo)
    end
  end

  describe "saldos" do
    alias Financess.Financeiro.Saldoo

    import Financess.FinanceiroFixtures

    @invalid_attrs %{saldoresultante: nil}

    test "list_saldos/0 returns all saldos" do
      saldoo = saldoo_fixture()
      assert Financeiro.list_saldos() == [saldoo]
    end

    test "get_saldoo!/1 returns the saldoo with given id" do
      saldoo = saldoo_fixture()
      assert Financeiro.get_saldoo!(saldoo.id) == saldoo
    end

    test "create_saldoo/1 with valid data creates a saldoo" do
      valid_attrs = %{saldoresultante: 42}

      assert {:ok, %Saldoo{} = saldoo} = Financeiro.create_saldoo(valid_attrs)
      assert saldoo.saldoresultante == 42
    end

    test "create_saldoo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financeiro.create_saldoo(@invalid_attrs)
    end

    test "update_saldoo/2 with valid data updates the saldoo" do
      saldoo = saldoo_fixture()
      update_attrs = %{saldoresultante: 43}

      assert {:ok, %Saldoo{} = saldoo} = Financeiro.update_saldoo(saldoo, update_attrs)
      assert saldoo.saldoresultante == 43
    end

    test "update_saldoo/2 with invalid data returns error changeset" do
      saldoo = saldoo_fixture()
      assert {:error, %Ecto.Changeset{}} = Financeiro.update_saldoo(saldoo, @invalid_attrs)
      assert saldoo == Financeiro.get_saldoo!(saldoo.id)
    end

    test "delete_saldoo/1 deletes the saldoo" do
      saldoo = saldoo_fixture()
      assert {:ok, %Saldoo{}} = Financeiro.delete_saldoo(saldoo)
      assert_raise Ecto.NoResultsError, fn -> Financeiro.get_saldoo!(saldoo.id) end
    end

    test "change_saldoo/1 returns a saldoo changeset" do
      saldoo = saldoo_fixture()
      assert %Ecto.Changeset{} = Financeiro.change_saldoo(saldoo)
    end
  end
end
