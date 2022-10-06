#include "BasicShaderHeader.hlsli"


// �O�p�`�̓��͂���A�O�p�`��2�o��
[maxvertexcount(6)]
void main(
	triangle VSOutput input[3] : SV_POSITION,
	inout TriangleStream< GSOutput > output
)
{
	// 1�ڂ̎O�p�`
	for (uint i = 0; i < 3; i++) {
		GSOutput element;
		element.svpos = input[i].svpos;
		element.normal = input[i].normal;
		element.uv = input[i].uv;
		output.Append(element);
	}
	// ���݂̃X�g���b�v���I��
	output.RestartStrip();

	// 2�ڂ̎O�p�`
	for (uint i = 0; i < 3; i++) {
		GSOutput element;
		// X������20���炷
		element.svpos = input[i].svpos + float4(20.0f, 0.0f, 0.0f, 0.0f);
		element.normal = input[i].normal;
		// UV��5�{��
		element.uv = input[i].uv * 5.0f;
		output.Append(element);
	}
}


