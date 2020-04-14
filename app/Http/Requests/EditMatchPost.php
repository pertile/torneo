<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Validator;
use App\Match;
use App\Instance;
use Illuminate\Support\Facades\Auth;

class EditMatchPost extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        $input = $this->input();
        $match = Match::find($input['id']);
        //dump(Auth::user()->name);
        return $match && $this->user()->can('edit', $match);
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $data = $this->input();

        $instance = Instance::find(Match::find($data['id'])->instance_id);
        $data['won'] = $instance->won;
        $data['draw'] = $instance->draw;
        $data['lost'] = $instance->lost;
        $data['absent'] = $instance->absent;
        $data['draw_possible'] = $instance->draw_possible;

        $v = Validator::make($data, [
            'home_score' => 'required|integer|between:0,300',
            'away_score' => 'required|integer|between:0,300',
            'home_points' => 'required|integer|between:0,2',
            'away_points' => 'required|integer|between:0,2',
            'date' => 'required|before_or_equal:today'
        ]);

        
        
        //valido que haya un dato de observaciones si no coincide el marcador real con el teórico
        $v->sometimes('note', 'required', function ($data) {
            //homePoints y awayPoints representan el marcador teórico
            if ($data->home_score > $data->away_score) {
               $homePoints = $data->won;
               $awayPoints = $data->lost;
           } else {
               if ($data->home_score < $data->away_score) {
                    $homePoints = $data->lost;
                    $awayPoints = $data->won;
               } else {
                   $homePoints = $data->draw;
                   $awayPoints = $data->draw;
               }
           }
           if (! $data->home_played) {
               $homePoints = $data->absent;
           }
           if (! $data->away_played) {
               $awayPoints = $data->absent;
           }
           
           if ($homePoints != $data->home_points || $awayPoints != $data->away_points) {
               return true;
           } else {
               return false;
           }
        });

        //validar empate
        $v->sometimes('home_score', 'different:away_score', function($data) {
            return ! $data->draw_possible;
        });

        return $v->getRules();
    }

    public function attributes()
    {
        return [
            'home_score' => 'marcador local',
            'away_score' => 'marcador visitante',
            'home_points' => 'puntos local',
            'away_points' => 'puntos visitante',
            'date' => 'fecha del partido',
            'note' => 'observaciones'
        ];
    }

    public function messages()
    {
        return [
            'note.required' => 'Si se modificaron manualmente los puntos es obligatorio ingresar una observación.',
            'home_score.different' => 'No puede haber empate.'
        ];
    }
}
