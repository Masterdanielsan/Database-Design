
--Using Stored Procedure to add Tracks--
exec EnterTrack 'DBA';
exec EnterTrack 'Development';
exec EnterTrack 'BI';
exec EnterTrack 'Performance Optimization';
exec EnterTrack 'Other';

select * from Track;