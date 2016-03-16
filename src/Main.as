package {

import flash.display.Sprite;
import flash.text.TextField;

public class Main extends Sprite {
    public function Main() {

		var army:Array = makeBadArmy();
		army[0]();
		army[1]();
		army[2]();

		var army1:Array = makeGoodArmy();
		army1[0]();
		army1[1]();
		army1[2]();
    }

	// а тут мы сохраняем значение в value
	private function makeGoodArmy():Array
	{
		var shooters:Array =[];
		for (var i:int = 0; i < 3; i++)
		{
			var shooter:Function = (function (value:int):Function { return function():void {trace(value)}})(i);
			shooters.push(shooter);
		}
		return shooters;
	}

	// каждая функция не хранит в себе значение i, она ссылается к внешнему контексту
	private function makeBadArmy():Array
	{
		var shooters:Array =[];
		for (var i:int = 0; i < 3; i++)
		{
			var shooter:Function = function():void {trace(i)};
			shooters.push(shooter);
		}
		return shooters;
	}
}
}
