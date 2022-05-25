local moo = import "moo.jsonnet";
local ns = "dunedaq.trigger.faketpcreatorheartbeatmaker";
local s = moo.oschema.schema(ns);

local types = {
  ticks: s.number("ticks", dtype="u8"),
  
  conf : s.record("Conf", [
    s.field("heartbeat_interval", self.ticks, 5000,
      doc="Interval between subsequent heartbeats being issued."),
    s.field("clock_frequency_hz", self.ticks,
      doc="Clock frequency in Hz"),
    s.field("heartbeat_send_offset_ms", self.ticks,
      doc="How many milliseconds behind the estimated time should we send heartbeats for"),
    
  ], doc="FakeTPCreatorHeartbeatMaker configuration parameters."),

};

moo.oschema.sort_select(types, ns)
