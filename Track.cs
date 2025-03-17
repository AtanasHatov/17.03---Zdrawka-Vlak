using System;
using System.Collections.Generic;

namespace project1.Data.Models;

public partial class Track
{
    public int TracksId { get; set; }

    public string? StationName { get; set; }

    public int? TrackNumber { get; set; }

    public int? TrainId { get; set; }

    public virtual Train? Train { get; set; }
}
