defmodule Hello.Sales.OrdersProduct do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orderproducts" do
    field :order_id, :id
    field :product_id, :id

    timestamps()
  end

  @doc false
  def changeset(orders_product, attrs) do
    orders_product
    |> cast(attrs, [])
    |> validate_required([])
  end
end
