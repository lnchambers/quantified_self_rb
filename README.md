[![Waffle.io - Columns and their card count](https://badge.waffle.io/lnchambers/quantified_self_rb.png?columns=all)](https://waffle.io/lnchambers/quantified_self_rb?utm_source=badge)
# README

This API is designed to interact with the Quantified Self front end located [here](https://github.com/lnchambers/quantified_self_fe).

# Endpoints

##Food Endpoints

`GET /api/v1/foods`

  -Return all foods in the database
  
`GET /api/v1/foods/:id`

  -Returns the requested food by id
  
`POST /api/v1/foods`

  -Creates a new food record in the database
  
`DELETE /api/v1/foods/:id`

  -Deletes a food record from the database by id
  
`PATCH /api/v1/foods/:id`

  -Updates a food record by id
  

##Meal Endpoints

`GET /api/v1/meals`

  -Returns all meals with their associated foods
  
`GET /api/v1/meals/:meal_id/foods`

  -Returns all the foods that belong to the meal id
  
`POST /api/v1/meals/:meal_id/foods/:id`

  -Creates a food that belongs to the meal id
  
`DELETE /api/v1/meals/:meal_id/foods/:id`

  -Removes a food that belongs to the meal id
  
