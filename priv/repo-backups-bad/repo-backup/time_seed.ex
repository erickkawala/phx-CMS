## optimization: cache with hash dict
# https://web.archive.org/web/20161116091132/http://ineverfinishanyth.in/2014/01/20/memoization-in-elixir
defmodule Time do
  alias Hello.Repo
  alias Hello.Accounts.User
  # set number of iterations below
  # (below, Time.month_Jan(1,1900,1,1))
  @nStop 1000000
  # do 1 MILLION days


  def month_Jan(n, years, months, days) do
    # Hello.Repo.insert!(%Hello.Accounts.User{name: "User#{n}",username: "Username#{n}", birth_year: {years}, birth_month: {months}, birth_day: {days}})
    IO.puts ("#{months}, #{days} , #{years}")
      if days == 31 do
        if rem(years,4) == 0 do
          month_Feb_leap(n+1, years, months+1, 1)
        else
          #                             days 
          month_Feb(n+1, years, months+1, 1)
        end
    #recurse until Jan. 31
    end
    month_Jan(n+1, years, months, days+1)
  end

  # handle feb, month with 28 days
  # then call March, 31 days, fn months_31
  def month_Feb(n, years, months, days) do
    
    IO.puts ("#{months}, #{days} , #{years}")

    if days == 28 do
      #                             days 
      months_31(n+1, years, months+1, 1)
      # recurse until Feb 28th, call March  -> fn months_31
    end

    month_Feb(n+1, years, months, days+1)
  end

  # months with 30 days
  def months_30(n, years, months, days) do

    IO.puts ("#{months}, #{days} , #{years}")

    if days == 30 do
      #                              days
      months_31(n+1, years, months+1, 1)
    end

    months_30(n+1, years, months, days+1)
  end

  # months with 31 days
  def months_31(n, years, months, days) do

    IO.puts ("#{months}, #{days} , #{years}")

    if n == @nStop do
      exit(:shutdown)
    end

    # if December 31st, 2019, loop back to 1900
    # to seed in a relatively even fashion
    if months == 12 and days == 31 and years == 2019 do
      month_Jan(n+1, 1900,  1,   1)
    end

    # if it's July, go to Aug for 31 days
    if months == 7 and days == 31 do
      #                              days
      month_Aug(n+1, years, months+1, 1)
    end
    # if n % 364 == 0
    # start in Jan next year, 31 days -> months_31
    if rem(n,365) == 0 do
      #                      mo's, days
      month_Jan(n+1, years+1,  1,   1)
    end

    if days == 31 do
    #                                days
      months_30(n+1, years, months+1, 1)
    end

    months_31(n+1, years, months, days+1)
  end

  def month_Aug(n, years, months, days) do

    IO.puts ("#{months}, #{days} , #{years}")
    
    if days == 31 do
      months_30(n+1, years, months+1, 1)
    end

    #recurse until Aug. 31, then call month_30 for September ^
    month_Aug(n+1, years, months, days+1)
  end

  def month_Feb_leap(n, years, months, days) do

    IO.puts ("#{months}, #{days} , #{years}")

    if days == 29 do
      #                             days 
      months_31(n+1, years, months+1, 1)
      # recurse until Feb 28th, call March  -> fn months_31
    end

    month_Feb_leap(n+1, years, months, days+1)
  end

end
#endtime
IO.puts ("Mos,Days,Years")
Time.month_Jan(1,1900,1,1)
