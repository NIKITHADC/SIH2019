% Calculate the maximum flow between all the nodes in a Directed Graph %

% Creating a graph with 8 nodes with some weights %
% 1->1, 1->4, 1->8, 2->3 and so on... %
s = [1 1 1 2 2 3 3 4 5 5 6 7];
t = [2 4 8 3 7 4 6 5 6 8 7 8];

%These weights would be given from the F-CNN%
% Using static pre-defined weights for now %
weights = [10 10 1 10 1 10 1 1 12 12 12 12];

% Adding labels to Nodes 
names = {'A' 'B' 'C' 'D' 'E' 'F' 'G' 'H'};
G = digraph(s,t,weights,names);
 
H = plot(G,'EdgeLabel',G.Edges.Weight);

%As the structure of the graph is static, we know which nodes have edges
%between them %

%Calculating the MaxFlow using Ford-Fulkerson algorithm between every pair
%of node%

%We can hard-code the nodes between which we need to find the max flow
%because the structure of the graph is static%

mf = maxflow(G,1,6);

% For finding all paths between two nodes, we run a DFS"
% We can do this easily using an in-built function"
v = dfsearch(G,1);

%Creating a function for calculating MaxFlow%

function max_flow = Calculate(G, node1, node2)

max_flow = maxflow(G, node1,node2, 'augmentpath');
end












