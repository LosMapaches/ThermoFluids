clc
format short

for i=1:length(p1)
    Value(i)=ReynoldTheoretical1{i}(1,1);
    ValueError(i)=ReynoldTheoretical1{i}(2,3);
end
ReynoldTheoreticalone=[cell2mat(Value)' cell2mat(ValueError)']

for i=1:length(p1)
    Value(i)=ReynoldExperimental1{i}(1,1);
    ValueError(i)=ReynoldExperimental1{i}(2,3);
end
ReynoldExperimentalone=[cell2mat(Value)' cell2mat(ValueError)']

for i=1:length(StraightStraightUpstream)
    Value(i)=StraightFrictionFactor{i}(1,1);
    ValueError(i)=StraightFrictionFactor{i}(2,3);
end
StraightFrictionFactorOne=[cell2mat(Value)' cell2mat(ValueError)']

for i=1:length(StraightStraightUpstream)
    Value(i)=StraightRoughnessCoefficient{i}(1,1);
    ValueError(i)=StraightRoughnessCoefficient{i}(2,3);
end
StraightRoughnessCoefficientOne=[cell2mat(Value)' cell2mat(ValueError)']