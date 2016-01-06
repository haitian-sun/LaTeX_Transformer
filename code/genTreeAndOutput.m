load('model_sub.mat')
load('model_super.mat')
load('formula.mat') % this is the position information for each symbol
load('symbol.mat') % this is the classified symbol

root_array = constr_tree(model_sub, model_super, formula);
generate_code(root_array, symbol)

