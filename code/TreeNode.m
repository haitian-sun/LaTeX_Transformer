classdef TreeNode < handle
    properties
        img_id
        super
        sub
        right
        left
        has_super
        has_sub
        has_right
        has_left
    end
    methods
        function obj = TreeNode(val)
            obj.img_id = val;
            obj.has_super = 0;
            obj.has_sub = 0;
            obj.has_right = 0;
            obj.has_left = 0;
        end
            
    end
end