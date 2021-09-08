defmodule Exmeal.Meals.Create do
  alias Exmeal.Error
  alias Exmeal.Meal
  alias Exmeal.Repo

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_create()
  end

  defp handle_create({:ok, %Meal{}} = result), do: result

  defp handle_create({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
