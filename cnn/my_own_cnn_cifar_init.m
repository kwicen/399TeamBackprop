function net = cnn_cifar_init(opts)

lr = [0.2 2] ;

net.layers = {} ;

net.layers{end+1} = struct('type', 'conv', ...
    'weights', {{0.01*randn(5,5,3,32, 'single'), zeros(1, 32, 'single')}}, ...
    'learningRate', 0.1*lr, ...
    'stride', 1, ...
    'pad', 2) ;

net.layers{end+1} = struct('type', 'relu') ;

net.layers{end+1} = struct('type', 'pool', ...
    'method', 'avg', ...
    'pool', [3 3], ...
    'stride', 2, ...
    'pad', [0 1 0 1]) ;

net.layers{end+1} = struct('type', 'conv', ...
    'weights', {{0.05*randn(16,16,32,10, 'single'), zeros(1,10,'single')}}, ...
    'learningRate', .1*lr, ...
    'stride', 1, ...
    'pad', 0) ;

% net.layers{end+1} = struct('type', 'conv', ...
%                            'weights', {{0.05*randn(1,1,32,10, 'single'), zeros(1,10,'single')}}, ...
%                            'learningRate', .1*lr, ...
%                            'stride', 1, ...
%                            'pad', 0) ;
% Loss layer
net.layers{end+1} = struct('type', 'softmaxloss') ;