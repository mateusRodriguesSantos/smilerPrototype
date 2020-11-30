//
//  FaceDetection.swift
//  Prototype
//
//  Created by Mateus Rodrigues Santos on 30/11/20.
//

import Foundation

/*
 
Todas as APIs da estrutura Vision usam três construções:

Solicitação: a solicitação define o tipo de coisa que você deseja detectar e um manipulador de conclusão que processará os resultados. Esta é uma subclasse de VNRequest.
Manipulador de solicitação: o manipulador de solicitação executa a solicitação no buffer de pixel fornecido (pense: imagem). Isso será VNImageRequestHandlerpara uma única detecção única ou VNSequenceRequestHandlerpara processar uma série de imagens.
Resultados: os resultados serão anexados à solicitação original e passados ​​para o manipulador de conclusão definido ao criar a solicitação. Eles são subclasses deVNObservation
*/
