# DCS ASP rules

## Ontology

### Diagram

```mermaid
---
title: Ontology
---
graph TB

    subgraph Core elements
        %% Classes
        Scene(Scene)
        Stripe(Stripe)
        Tile(Tile)
        %% TileProperty(TileProperty)
        Asset(Asset)
        AssetProperty(AssetProperty)
    end

    %% Properties (Core elements)
    Scene -- has height --> height{{int}}
    Scene -- contains stripe --> Stripe
    Stripe -- contains tile --> Tile
    Tile -- contains asset --> Asset
    Tile -- has state --> AgentState
    %% Tile -- has property --> TileProperty
    Asset -- has property --> AssetProperty
    Asset -- same as --> Asset
    Asset -- label --> label{{label}}

    subgraph Actions Compatibility Preferences Variation
        direction LR
        %% Classes
        Action(Action)
        AgentState(AgentState)
        Direction(Direction)
        
        Compatibility(Compatibility)

        Preference(Preference)
        
        Variation(Variation)
    end

    %% Properties (Actions and Compatibility)
    Action -- has direction --> Direction
    Direction -- has value --> direction{{int,int}} %% the first refers to the stripes, the second to the tiles (of the current stripe)
    Action -- has precondition --> AgentState
    Action -- has effect --> AgentState

    Compatibility -- has direction --> Direction
    Compatibility -- source asset --> Asset
    Compatibility -- target asset --> Asset

    Variation -- has direction --> Direction
    Variation -- min threshold --> minthreshold{{int}}
    Variation -- max threshold --> maxthreshold{{int}}

    Preference -. a .- Compatibility
    Preference -- has priority --> priority{{"low|medium|high"}}

    subgraph Assets properties %% and Tiles
        direction LR
        %% Classes
        Passable(Passable)
        %% Reachable(Reachable)
        %% PossibleReachable(Possible Reachable)
    end

    %% Properties (Assets and Tiles properties)
    %% Passable -. a .-> AssetProperty
    AssetProperty -. a .- Passable
    %% TileProperty -. a .- Passable & Reachable & PossibleReachable
```

### Vocabulary

#### Scene

A scene of the game.

#### Stripe

A scene is composed of stripes.

#### Tile

A stripe is composed of tiles.

#### Asset

Each tile contains an asset.

#### AssetProperty

Assets may have specific properties.

#### Action

Actions represent how agents states evolve.

#### AgentState

The state that an agent can have in a specific tile.

#### Direction

A direction encoded as a pair `<Stripe,Tile>`.

#### Compatibility

How assets can be placed.

#### Preference

How assets should be placed.

#### Variation

Introduce variability on the generated stripes.

#### Passable

An asset property that encodes that an asset can be traversed by agents.

## Assumptions

- The height of the scene is constant
- We can create one stripe at a time
- All tiles have the same size
- Tiles are numbered in the range $(1 \dots h)$ with $h$ the height of the scene

## Atoms

In the following are described all the atoms used.

### Facts

#### `action(Direction,Precondition,Effect)`

If the Tile in direction `Direction` has the state `Precondition`, then this Tile gets the state `Effect`.

#### `asset(AssetID)`

An Asset is identified by its `AssetID`.

#### `compatible(Asset1,Asset2,Direction)`

Asset `Asset1` is compatible with Asset `Asset2` in direction `Direction`.

Utility rules (regarding opposite directions) help to decrease the number of facts that need to be defined manually.

#### `has_property(AssetID,Property)`

Asset `AssetID` has property `Property`.

#### `height(Height)`

The height of the Scene is `Height`.

#### `preference(Asset1,Asset2,Direction,Priority)`

Asset `Asset1` is `Priority` preferred with Asset `Asset2` in direction `Direction`.

#### `same_as(Asset1,Asset2)`

Asset `Asset1` has to be considered the same as Asset `Asset2` when computing stripe variation.

Utility rules (regarding reflexivity, symmetry, and transitivity) help to decrease the number of facts that need to be defined manually.

#### `variation(Direction,MinThreshold,MaxThreshold)`

Tiles variation w.r.t. direction `Direction` must be at least `MinThreshold` and at most `MaxThreshold` (in percentage, `0..100`).

> In the following are described facts provided in the first iteration and subsequently derived automatically.

#### `contains_asset(TileID,AssetID)`

The Tile `TileID` contains the Asset `AssetID`.

#### `current_stripe(StripeID)`

The Stripe identified by `StripeID` is the *current stripe* (i.e., the one that needs to be generated in this iteration).

#### `has_state(Tile,AgentState)`

The agent can be inside the Tile `Tile` with state `AgentState`.

#### `stripe(StripeID)`

A Stripe is identified by its `StripeID`.

#### `tile(StripeID,TileID)`

A Tile is identified by its `StripeID` and its `TileID`.

### Output atoms

#### `current_asset(TileID,AssetID)`

The Tile `TileID` (of the current stripe) contains Asset `AssetID`.

## Rules

In the following is described the purpose of the rules in each module.

### DCS_start_screen

The initial screen of the game (for testing purposes only).

### DCS_background_knowledge

The background knowledge (specific) of the game.

### DCS_init

Initialise the environment of the game (Knowledge Completion of the background knowledge).

### DCS_guess_passable_tiles

Guess the passable Tiles in the current Stripe.

### DCS_possible_reachable_tiles

Identify the Tiles that could be reached in this Stripe.

### DCS_guess_reachable_tiles

Guess the reachable Tiles in the current Stripe.

### DCS_assign_assets

Assign an Asset to each Tile.

### DCS_check_compatibility

Verifies the compatibility requirements for each Tile in the current Stripe.

### DCS_check_variation

Compute the variation between Stripes and then verifies that it is within the thresholds.

### DCS_preferences

Automate the preferences about the results.

### DCS_add_delete_update

Compute the atoms to keep/remove in the following iterations.

### DCS_output

Compute the output (Assets for each Tile in the current Stripe).
