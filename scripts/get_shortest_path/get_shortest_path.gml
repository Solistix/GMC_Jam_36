// get_shortest_path(Source, Target)
var Source, Target, OpenedList, ClosedList, PreviousNodes, TentativeDistances, CurrentNode, Connections;
var tentativeDistance, Score, heuristicValue, currentScore;

// Note Source and Target are an array of coords.
Source = get_grid_index(argument0[0], argument0[1]);
Target = get_grid_index(argument1[0], argument1[1]);

OpenedList = ds_priority_create(); //{Value: Node, Priority: Score}
ClosedList = ds_list_create();
PreviousNodes = ds_map_create();//{Key: Node, Value: PreviousNode}
TentativeDistances = ds_map_create(); //{Key: Node, Value: Distance}

CurrentNode = noone;
ds_priority_add(OpenedList, Source, 1);
ds_map_add(TentativeDistances, Source, 0);

while (ds_priority_size(OpenedList) > 0) {
    CurrentNode = ds_priority_find_min(OpenedList);

    if (CurrentNode == Target) {
        break;
    }

    ds_priority_delete_min(OpenedList); //Remove current node
    ds_list_add(ClosedList, CurrentNode);
	
    Connections = ds_map_find_value(global.node_connections_map, CurrentNode)// List of Connections
    for (var i = 0; i < ds_list_size(Connections); i++) {
		var Neighbour = Connections[|i];
       
        if (ds_list_find_index(ClosedList, Neighbour) != -1) {
            continue;
        }
       
        if (!filter_path(Neighbour)) {
            continue;
        }
		
       // ----------------------
	   // Get Node Distance 
		var nodeObj = ds_grid_get(global.room_grid, Neighbour mod global.grid_width, floor(Neighbour / global.grid_width));
		var nodeDistance;
		
		if (nodeObj != 0 || nodeObj != 1){
			if (object_get_parent(nodeObj.object_index) == obj_enemy) {
				nodeDistance = 5 // Value for enemies for now
			} else nodeDistance = 1;
		} else {
			nodeDistance = 1;
		}
		// ----------------------
		
        tentativeDistance = nodeDistance + ds_map_find_value(TentativeDistances, CurrentNode);
        heuristicValue = get_heuristic_value(Neighbour, Target)
       
        if (!ds_map_exists(TentativeDistances, Neighbour)) {
            ds_map_add(TentativeDistances, Neighbour, tentativeDistance);
        } else if (tentativeDistance < ds_map_find_value(TentativeDistances, Neighbour)) {
            ds_map_replace(TentativeDistances, Neighbour, tentativeDistance);
        }
       
        currentScore = ds_priority_find_priority(OpenedList, Neighbour);
        Score = ds_map_find_value(TentativeDistances, Neighbour) + heuristicValue; // Removed + 1 HMMM?

        if (Score < currentScore || currentScore == 0 || is_undefined(currentScore)) {
            if (currentScore == 0 || is_undefined(currentScore)) {
                ds_priority_add(OpenedList, Neighbour, Score);
            } else {
                ds_priority_change_priority(OpenedList, Neighbour, Score);
            }
           
            if (!ds_map_exists(PreviousNodes, Neighbour)) {
                ds_map_add(PreviousNodes, Neighbour, CurrentNode);
            } else {
                ds_map_replace(PreviousNodes, Neighbour, CurrentNode);
            }
        }
    }
	
}

ds_priority_destroy(OpenedList);
ds_list_destroy(ClosedList);
ds_map_destroy(TentativeDistances);
   
if (CurrentNode != Target) {
    ds_map_destroy(PreviousNodes);
    return(noone);
}

var Path;
Path = ds_list_create();
while (true) {
    ds_list_add(Path, CurrentNode);
    if (CurrentNode == Source) {
        reversedPath = ds_list_create();
        for (i = ds_list_size(Path) - 1; i >= 0; i--) {
            ds_list_add(reversedPath, ds_list_find_value(Path, i));
			//show_debug_message(ds_list_find_value(Path, i));
        }
        ds_list_destroy(Path);
        ds_map_destroy(PreviousNodes);
        return(reversedPath);
    }

    CurrentNode = ds_map_find_value(PreviousNodes, CurrentNode);
}
