defmodule NebulexRedisAdapter.ClientClusterTest do
  use ExUnit.Case, async: true
  use NebulexRedisAdapter.CacheTest

  alias NebulexRedisAdapter.TestCache.ClientCluster, as: Cache

  setup do
    {:ok, pid} = Cache.start_link()
    _ = Cache.flush()
    :ok

    on_exit(fn ->
      :ok = Process.sleep(100)
      if Process.alive?(pid), do: Cache.stop(pid)
    end)

    {:ok, cache: Cache, name: Cache}
  end
end