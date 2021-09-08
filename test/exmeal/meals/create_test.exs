defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true
  alias Exmeal.Meals.Create

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = %{
        calories: 20,
        date: "2001-05-02 23:00:07",
        description: "Banana"
      }

      response = Create.call(params)

      assert {:ok,
              %Exmeal.Meal{
                calories: 20,
                date: ~N[2001-05-02 23:00:07],
                description: "Banana",
                id: _id
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calories: 20,
        date: ~D[2001-05-02]
      }

      response = Create.call(params)

      assert {:error, %Exmeal.Error{}} = response
    end
  end
end
