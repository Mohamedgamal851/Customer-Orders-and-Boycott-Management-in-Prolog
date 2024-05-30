:-consult(data).
:- dynamic [item/3, alternative/2, boycott_company/2].
% Mostafa Adel khodary - 20211093 - Cs S5,6
% Mohamed Gamal Abdelmonem - 20211080 - Cs S5,6
% Rahma khalid abdelkhaleq - 20210130 - Is S5,6
% Aya Aboelsood Hamdy  - 20200102 - Is 5,6
% Predicates for tasks
memberof(X, [X|_]).
memberof(X, [_|T]) :-
	memberof(X, T).
len([],0).
len([_|T], N) :-
	len(T, N1),
    N is N1 + 1.
calcPrice([], 0).
calcPrice([Item|RestItems], TotalPrice) :-
    calcPrice(RestItems, TotalPrice1),
    item(Item, _, Price),
    TotalPrice is TotalPrice1 + Price.
% First task 
list_orders(CustUserName, Orders) :-
	listOrders(CustUserName, Orders, []).
listOrders(CustUserName, [Order|RestOrders], CustOrders) :-
	customer(CustomerID, CustUserName), 
	order(CustomerID, OrderID, Items), 
	Order = order(CustomerID, OrderID, Items), 
	 \+ memberof(Order, CustOrders),  
	listOrders(CustUserName, RestOrders, [Order|CustOrders]).
listOrders(_, [], _). 
% Second task
countOrdersOfCustomer(CustUserName, C) :-
	list_orders(CustUserName, Orders), 
	len(Orders, C).
% Third task
getItemsInOrderById(CustUserName,OrderID,Items) :-
    customer(CustomerID, CustUserName),
    order(CustomerID, OrderID, Items).
% Fourth task
getNumOfItems(CustUserName,OrderID,C) :-
    getItemsInOrderById(CustUserName,OrderID,Items),
    len(Items, C).
% Fifth task
calcPriceOfOrder(CustUserName,OrderID,TotalPrice) :-
    getItemsInOrderById(CustUserName,OrderID,Items),
    calcPrice(Items, TotalPrice).
% Sixth task
isBoycott(Name) :-
    boycott_company(Name,_) ; alternative(Name,_).
% Seventh task
whyToBoycott(Name, Justification) :-
    boycott_company(Name, Justification) ; item(Name, Company, _), boycott_company(Company, Justification).
% Eighth task
remove_boycott_items([], []).
remove_boycott_items([Item|Rest], Filtered) :-
    isBoycott(Item), !, % If the item is a boycott item, skip it
    remove_boycott_items(Rest, Filtered).
remove_boycott_items([Item|Rest], [Item|FilteredRest]) :-
    remove_boycott_items(Rest, FilteredRest).
removeBoycottItemsFromAnOrder(CustUserName, OrderID, NewList) :-
    getItemsInOrderById(CustUserName, OrderID, OrderItems),
    remove_boycott_items(OrderItems, NewList).
% Ninth task
replace_boycott_items([], []).
replace_boycott_items([Item|Rest], [Replaced|FilteredRest]) :-
    (isBoycott(Item) ->
        (alternative(Item,Alternative) ->
            Replaced = Alternative
        ;   Replaced = Item)
    ;   Replaced = Item),
    replace_boycott_items(Rest, FilteredRest).
replaceBoycottItemsFromAnOrder(CustUserName, OrderID, NewList) :-
    getItemsInOrderById(CustUserName, OrderID, OrderItems),
    replace_boycott_items(OrderItems, NewList).
% Tenth task
calcPriceAfterReplacingBoycottItemsFromAnOrder(CustUserName, OrderID, NewList, TotalPrice) :-
    replaceBoycottItemsFromAnOrder(CustUserName, OrderID, NewList), 
    calcPrice(NewList, TotalPrice).
% Eleventh task
getTheDifferenceInPriceBetweenItemAndAlternative(Item, Alternative, DiffPrice) :-
	item(Item, _, Price1), 
	alternative(Item, Alternative), 
	item(Alternative, _, Price2), 
	DiffPrice is Price1 - Price2.
% Twelfth task
add_item(Item, Company, Price) :-
    assert(item(Item, Company, Price)).
remove_item(Item, Company, Price) :-
    retract(item(Item, Company, Price)).
add_alternative(Item, Alternative) :-
    assert(alternative(Item, Alternative)).
remove_alternative(Item, Alternative) :-
    retract(alternative(Item, Alternative)).
add_boycott_company(Company, Justification) :-
    assert(boycott_company(Company, Justification)).
remove_boycott_company(Company, Justification) :-
    retract(boycott_company(Company, Justification)).








