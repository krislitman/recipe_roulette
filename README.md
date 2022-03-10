## Recipe Roulette API

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

**Find a new recipe, filter by categories, meal prep options!**

## Table of Contents

  - [Author](#author)
  - [Getting Started](#getting-started)
  - [Endpoints](#endpoints)
  - [Runing the tests](#running-the-tests)
  - [Built With](#built-with)
  - [Versioning](#versions)
  - [Acknowledgements](#acknowledgements)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Author

  - **Kris Litman**<br>
    [GitHub](https://github.com/krislitman)<br>
    [LinkedIn](https://www.linkedin.com/in/kris-litman/)

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Getting Started

### Installing

These instructions will get you up and running with a copy of the project on
your local machine for development and testing purposes.

1. Fork and Clone this repo
2. Install gem packages: `bundle`
3. Run `rackup` to start the server
4. Go to "localhost:9292" to view the Development environment for the application!

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Endpoints

#### Random Recipe
**`GET localhost:9292/api/v1/random`**
<ul><li>Returns a random Recipe from the database. Accepts an optional limit arguement, defaults to 1.</li></ul>

Example Response:
```
{
    "name": "Chippy Taco Marinade",
    "serves": "~",
    "prep_time": "10 Minutes",
    "cooking_time": "~",
    "ingredients": "(\"1 pound Boneless, Skinless chicken thighs or breasts\",\"2 cloves garlic minced\",\"1 tablespoon lime juice optional\",\"1 tablespoon olive oil\",\"1 tablespoons chili\",\"1 tablespoon cumin\",\"1 teaspoon paprika\",\"1 teaspoon smoked paprika\",\"1 teaspoon salt\",\"1/2 teaspoon oregano\",\"1/4 teaspoon black pepper\",\"1 teaspoon corn starch optional\")",
    "instructions": "(\"Combine spices and corn starch in medium mixing bowl. Then add in garlic, lime juice, evoo; mix well with whisk.\",\"Cut chicken into ¾ inch bitesize pieces, add to bowl. Toss together, place in Ziploc in fridge, for at least 30 minutes, or up to 24 hours.\",\"Drain if necessary before cooking.\",\"Note: if you add extra lime juice, decrease the marinate time to maximum of 12 hours.\")",
    "author": null
}
```


![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Running the tests

**Testing with RSpec**
To run the full test suite you will need to run the command:
`rspec`

To run individual tests use:
`rspec spec/folder/file`

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Built With

- Ruby
- Roda
- Sequel
- RSpec

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Versions

- Ruby 3.0.0

![-----------------------------------------------------](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/cloudy.png)

## Acknowledgements
