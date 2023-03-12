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
        Asset(Asset)
        AssetProperty(AssetProperty)
        %% TileProperty(TileProperty)
    end

    %% Properties (Core elements)
    Scene -- has height --> height{{int}}
    Scene -- contains stripe --> Stripe
    Stripe -- contains tile --> Tile
    Tile -- contains asset --> Asset
    Asset -- has property --> AssetProperty
    Tile -- has state --> AgentState
    %% Tile -- has property --> TileProperty
    Asset -- same as --> Asset

    subgraph Actions and Compatibility and Variation
        direction LR
        %% Classes
        Action(Action)
        AgentState(AgentState)
        Direction(Direction)
        
        Compatibility(Compatibility)
        
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
    Variation -- threshold --> threshold{{int}}

    subgraph Assets properties %% and Tiles
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

TBC

## Assumptions

- The height of the scene is constant
- We can create one stripe at a time
- All tiles have the same size
- Tiles are numbered in the range $(1 \dots h)$ with $h$ the height of the scene

## Atoms

TBC

### Facts (EDBs)

TBC

### Intermediate atoms (IDBs)

TBC

## Rules

TBC

### DCS_start_screen

The initial screen of the game (for testing purposes only)

### DCS_background_knowledge

The background knowledge (specific) of the game

### DCS_init

Initialise the environment of the game (Knowledge Completion of the Background Knowledge)

### DCS_possible_reachable_tiles

Identify the tiles that could be reached in this stripe

### DCS_guess_passable_tiles

Guess the passable Tiles in the current Stripe

### DCS_guess_reachable_tiles

Guess the reachable Tiles in the current Stripe

### DCS_assign_assets

Assign an asset to each tile

### DCS_check_compatibility

Verifies the compatibility requirements for each Tile in the current Stripe

### DCS_stripe_variation

Compute the variation between stripes and then verifies that it is less than the threashold

### DCS_preferences

The preferences about the results

### DCS_add_delete_update

Compute the atoms to keep/remove in the following iterations
