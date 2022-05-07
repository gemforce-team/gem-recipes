Gem Recipes
===========

Optimal gem recipes for [Gemcraft 2: Chasing Shadows](https://store.steampowered.com/app/296490/GemCraft__Chasing_Shadows/) and
[GemCraft: Frostborn Wrath](https://store.steampowered.com/app/1106530/GemCraft__Frostborn_Wrath/).

### Table of contents:

* **[Link to the recipe calculator program](https://github.com/gemforce-team/gemforce/#readme)**
* **[Link to the GCCS combiner bot (wGemCombiner)](https://github.com/gemforce-team/wGemCombiner/#readme)**
* **[Link to the GCFW combiner mod (Gemsmith)](https://github.com/gemforce-team/gemsmith/#readme)**
* [Results naming convention](#results-naming-convention)  
* [Assumptions on skils and layout](#assumptions-on-skills-and-layout)  
* [Parenthesis convention](#parenthesis-convention)  

### Results naming convention

The results are divided in folders for each game, with common types in the root.  
The subfolder are for gem type (leech/crit/managem/killgem) and kind (combine/amps/omnia).  
The `scripts` folder does not contain recipes, only scripts used to manage them.  
Recipe names are composed by a gem type (as above), a recipe kind and number(s) for the recipe length.

The recipe kind can be:

* `combine` - a combine which should be used on an already built gem  
* `amps`  (GCCS only) - a pair of main gem spec and amps spec in optimal proportions,
                        made to be upgraded both with the same combine  
* `omnia` (GCCS only) - a set of four recipes: a main gem spec and its amps spec in optimal proportions
                        and a pair of optimal combines for both, it's the pinnacle of *gem rocket science*  

The number(s) specify how many base gems go into specific recipe:  

* combine:   `N` - the combine costs `N` base gems, as easy as it gets  
* amps:    `G-A` - the main gem costs `G` gems while its amps cost `A` each  
* omnia:   `G-C` - the main gem costs `G` gems, the optimized amps cost is only inside the file
                   and both the combines require `C` copies of the main gem/amplifier 

Recipes are sorted by size, a measure of "recipe goodness" is:
* combine: **Growth**, that is `log(power)/log(value)`  
* amps:    **Spec coefficient**, that is `power*total_cost^-growth_comb`  
* omnia:   **Global power**, that is the power of the whole package when g30 eq mana has been spent on it

I try to have here all the `2^n` recipes and the best between every `2^n`and `2^(n+1)` 
for the `amps` and `comb` sections, if there is none between a pair it means the `2^(n+1)` one was the best.  
There are then selected ones from the `omnia` kind, as having all the combinations would be impossible.


### Assumptions on skills and layout

Recipes without amps are independent from skills and layout issues, so combines need no extra care.

For recipes that deal with amps, it's important to know how many amps are available for each gem and
how many gems are seen by each amp on average.  
This depends on the actual game's meta, so I've made reasonable choices:
* GCCS managems: there are 2 amps per gem, each amp sees 2.5 gems on average
* GCCS killgems: there are 8 amps for gem, each amp sees 1 gem 
* GCFW both:     there are 2 amps for gem, each amp sees 2.5 gems on average

Values of these can be set via the `-Q` and `-G` flags of gemforce.

To accurately estimate the effect of amps it's also needed to know some skills values, these depend on the game:

* Amplifiers:  assumed at  `60` for GCCS, `200` for GCFW - it matters quite a lot  
* True Colors: assumed at `120` for GCCS, not needed in GCFW - it matters nearly nothing

For GCCS managems the assembly power changes by over 10% across the reasonable amps skill levels.
Therefore the best known spec (currently `2048`) is also given in A120 and A240 versions,
for use by players whose amp skills is closer to such values.

The above includes talisman bonuses.  
Values of these can be set via the `-A` and `-T` flags of gemforce.


### Parenthesis convention

In most parenthesis schemes you'll find gems written as `3o` or `4k`, etc.  
This simply mean that the gem is the basic gem upgraded the written number of times minus one:
`4o` = `3o+3o` = `(2o+2o)+(2o+2o)` = `((o+o)+(o+o))+((o+o)+(o+o))` which is the base gem upgraded 3 times.
