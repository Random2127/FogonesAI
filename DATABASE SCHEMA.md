
## USERS
| Campo         | Tipo      | Clave | Restricciones        |
|--------------|----------|------|----------------------|
| id           | UUID     | PK   | NOT NULL             |
| user_hash    | VARCHAR  | UQ   | UNIQUE               |
| username     | VARCHAR  |      | NOT NULL             |
| email        | VARCHAR  | UQ   | UNIQUE               |
| password_hash| VARCHAR  |      | NOT NULL             |
| created_at   | TIMESTAMP|      |                      |

## RECIPES
| Campo        | Tipo      | Clave | Restricciones        |
|-------------|----------|------|----------------------|
| id          | UUID     | PK   | NOT NULL             |
| user_id     | UUID     | FK   | → USERS.id           |
| title       | VARCHAR  |      | NOT NULL             |
| description | TEXT     |      |                      |
| ingredients | JSON     |      |                      |
| instructions| JSON     |      |                      |
| prep_time   | INTEGER  |      |                      |
| cook_time   | INTEGER  |      |                      |
| servings    | INTEGER  |      |                      |
| difficulty  | VARCHAR  |      |                      |
| image_url   | VARCHAR  |      |                      |

## FAVORITES
| Campo      | Tipo      | Clave | Restricciones        |
|-----------|----------|------|----------------------|
| id        | UUID     | PK   | NOT NULL             |
| user_id   | UUID     | FK   | → USERS.id           |
| recipe_id | UUID     | FK   | → RECIPES.id         |
| created_at| TIMESTAMP|      |                      |

Constraint:
UNIQUE(user_id, recipe_id)

## DIETARY_OPTIONS
| Campo       | Tipo     | Clave | Restricciones        |
|------------|---------|------|----------------------|
| id         | UUID    | PK   | NOT NULL             |
| name       | VARCHAR |      | NOT NULL             |
| description| TEXT    |      |                      |

## USER_DIETARY_PREFERENCES
| Campo              | Tipo | Clave   | Restricciones        |
|-------------------|------|--------|----------------------|
| user_id           | UUID | PK, FK | → USERS.id           |
| dietary_option_id | UUID | PK, FK | → DIETARY_OPTIONS.id |

PK: (user_id, dietary_option_id)

## RECIPE_DIETARY_OPTIONS
| Campo              | Tipo | Clave   | Restricciones        |
|-------------------|------|--------|----------------------|
| recipe_id         | UUID | PK, FK | → RECIPES.id         |
| dietary_option_id | UUID | PK, FK | → DIETARY_OPTIONS.id |

PK: (recipe_id, dietary_option_id)

## NUTRITION
| Campo         | Tipo    | Clave | Restricciones        |
|--------------|--------|------|----------------------|
| id           | UUID   | PK   | NOT NULL             |
| recipe_id    | UUID   | FK   | → RECIPES.id         |
| calories     | INTEGER|      |                      |
| proteins     | DECIMAL|      |                      |
| carbohydrates| DECIMAL|      |                      |
| fiber        | DECIMAL|      |                      |